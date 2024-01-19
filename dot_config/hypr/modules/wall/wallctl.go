package main

import (
	"encoding/json"
	"fmt"
	"os"
	"os/exec"
	"os/user"
	"path/filepath"
)

var rootPath string
var currentWallpaper string
var wallpapers []string

type WallpaperInfo struct {
	CurrentWallpaper string   `json:"currentWallpaper"`
	Wallpapers       []string `json:"wallpapers"`
}

func setWallpaper(wallpaper string) {

	// command to set the wallpaper
	wallCmd := exec.Command("swww",
		"img", wallpaper,
		"--transition-type", "grow",
		"--transition-pos", "center",
		"--transition-step", "3",
		"--transition-fps", "60",
		"--transition-duration", "1",
		"--transition-bezier", ".16,.65,.75,.13")

	// run the command
	wallErr := wallCmd.Run()
	if wallErr != nil {
		fmt.Println("Error:", wallErr)
		return
	}
}

func checkFilesDir(wallPath string) ([]string, error) {
	files, err := os.ReadDir(wallPath)
	if err != nil {
		fmt.Println("Error listing files:", err)
		return []string{}, err
	}
	var fileNames []string
	for _, file := range files {
		if file.IsDir() {
			continue
		}
		fileNames = append(fileNames, file.Name())
	}
	fmt.Println(fileNames)
	return fileNames, nil
}

func getState(wallPath string) (string, []string, error) {
	jsonFilePath := filepath.Join(rootPath, "wallpapers.json")

	jsonData, err := os.ReadFile(jsonFilePath)
	if err != nil {
		fmt.Println("Error reading JSON File:", err)
		return "", nil, err
	}

	var wallpaperInfo WallpaperInfo
	err = json.Unmarshal(jsonData, &wallpaperInfo)
	if err != nil {
		fmt.Println("Error Unmarshaling JSON:", err)
		return "", nil, err
	}

	fmt.Println("Fetched Wallpapers From JSON Successfully")
	return wallpaperInfo.CurrentWallpaper, wallpaperInfo.Wallpapers, nil
}

func updateCurrentWallpaper(newCurrent string, fileNames []string) WallpaperInfo {
	wallpaperInfo := WallpaperInfo{
		CurrentWallpaper: newCurrent,
		Wallpapers:       fileNames,
	}
	return wallpaperInfo
}

func cycleWallpaper(direction bool) error { //TODO finish

	currentIndex := -1
	for i, name := range wallpapers {
		if name == currentWallpaper {
			currentIndex = i
			break
		}
	}

	if currentIndex == -1 {
		return fmt.Errorf("Current wallpaper not found in file list")
	}

	nextIndex := (currentIndex + 1) % len(wallpapers)

	if !direction {
		nextIndex = (currentIndex - 1 + len(wallpapers)) % len(wallpapers)
	}
	currentWallpaper = wallpapers[nextIndex]
	setWallpaper(filepath.Join(rootPath, "wallpapers", currentWallpaper))

	wallpaperInfo := WallpaperInfo{
		CurrentWallpaper: currentWallpaper,
		Wallpapers:       wallpapers,
	}
	return writeToJSON(wallpaperInfo)

}

func writeToJSON(wallpaperInfo WallpaperInfo) error {

	// Marshal struct to JSON
	var jsonData []byte
	jsonData, err := json.Marshal(wallpaperInfo)
	if err != nil {
		fmt.Println("Error marshaling to JSON:", err)
		return err
	}

	// Write the JSON data to a file
	var jsonFilePath string
	jsonFilePath = filepath.Join(rootPath, "wallpapers.json")
	err = os.WriteFile(jsonFilePath, jsonData, 0644)
	if err != nil {
		fmt.Println("Error writing JSON file:", err)
		return err
	}

	fmt.Println("Wallpapers info saved to", jsonFilePath)

	return nil
}

func isTheSame(ar1 []string, ar2 []string) bool {
	if len(ar1) != len(ar2) {
		return false
	}
	for i := 0; i < len(ar1); i++ {
		if ar1[i] != ar2[i] {
			return false
		}
	}
	return true
}

func verifyWallpapers(wallPath string) error {
	files, err := checkFilesDir(wallPath)
	if err != nil {
		fmt.Println("Error :", err)
		return err
	}
	if isTheSame(files, wallpapers) {
		return nil
	}
	wallpaperInfo := WallpaperInfo{
		CurrentWallpaper: files[0],
		Wallpapers:       files,
	}

	writeToJSON(wallpaperInfo)

	return nil
}

func main() {
	fmt.Println("Fetching wallpapers from JSON")

	currentUser, err := user.Current()
	if err != nil {
		fmt.Println("Error:", err)
		return
	}
	rootPath = filepath.Join(currentUser.HomeDir, ".config", "hypr")
	var wallPath string = filepath.Join(rootPath, "wallpapers")
	currentWallpaper, wallpapers, err = getState(wallPath)

	// Check for command-line arguments
	args := os.Args[1:]
	if len(args) < 1 {
		fmt.Println("Usage: hypr [next|prev|set <wallpaperName>|verify|current|help]")
		return
	}

	// Define a function to process each action
	processAction := func(action string) {
		switch action {
		case "next":
			if err := cycleWallpaper(true); err != nil {
				fmt.Println("Error:", err)
			} else {
				fmt.Println("Wallpaper cycled to the next one.")
			}
		case "prev":
			if err := cycleWallpaper(false); err != nil {
				fmt.Println("Error:", err)
			} else {
				fmt.Println("Wallpaper cycled to the previous one.")
			}
		// case "set":
		// 	if len(args) < 2 {
		// 		fmt.Println("Usage: hypr set <wallpaperName>")
		// 	} else {
		// 		wallpaperName := args[1]
		// 		if err := setCurrentWallpaper(wallpaperName); err != nil {
		// 			fmt.Println("Error:", err)
		// 		} else {
		// 			fmt.Printf("Wallpaper set to %s\n", wallpaperName)
		// 		}
		// 	}
		case "verify":
			if err := verifyWallpapers(wallPath); err != nil {
				fmt.Println("Error:", err)
			} else {
				fmt.Println("Wallpapers verified and JSON data updated if needed.")
			}
		// case "current":
		// 	currentWallpaper, err := getCurrentWallpaper()
		// 	if err != nil {
		// 		fmt.Println("Error:", err)
		// 	} else {
		// 		fmt.Printf("Current Wallpaper: %s\n", currentWallpaper)
		// 	}
		case "help":
			fmt.Println("Usage: [next|prev|set <wallpaperName>|verify|current|help]")
			fmt.Println("next                       Set the next image as wallpaper")
			fmt.Println("prev                       Set the prev image as wallpaper")
			fmt.Println("set <wallpaperName>        Set {wallpaperName} as wallpaper")
			fmt.Println("verify                     Verify and Correct the JSON Data")
			fmt.Println("current                    Reset the Current wallpaper and print its path")
			fmt.Println("help                       Print this message")
			fmt.Println("It is recommended to run Verify before each task")
		default:
			fmt.Printf("Unknown action: %s\n", action)
		}
	}

	// Process each action in the command-line arguments
	for i := 0; i < len(args); i++ {
		processAction(args[i])
	}
}
