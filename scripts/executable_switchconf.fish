#!/usr/bin/env fish

# Function to switch configurations
function switch_config
    set -l folders .local/share .local/state .cache .config

    echo Making sure all files exist...
    for folder in $folders
        if not test -d $HOME/$folder/$argv[2]
            echo "Error:"
            echo $HOME/$folder/$argv[2]" Does Not Exist!"
            exit 1
        end
    end

    echo Switching Configs...
    for folder in $folders
        echo  $folder
        # Remove any existing symbolic link
        mv $HOME/$folder/nvim $HOME/$folder/$argv[1]
        # echo moved $HOME/$folder/nvim to $HOME/$folder/argv[1]

        # Create a symbolic link to the desired configuration
        mv $HOME/$folder/$argv[2] $HOME/$folder/nvim
        # echo moved $HOME/$folder/$argv[2] to $HOME/$folder/nvim
    end

    echo All Done!!
end

set choice $argv[1]

if test "$choice" = lazyvim
    if test -d $HOME/.local/share/nvchad
        echo "You are already using lazyvim"
        exit 1
    end
    switch_config nvchad lazyvim
else if test "$choice" = nvchad
    if test -d $HOME/.local/share/lazyvim
        echo "You are already using nvchad"
        exit 1
    end
    switch_config lazyvim nvchad
else if test "$choice" = backup
    cp -r $HOME/.local/share/nvim $HOME/.local/share/nvim-backup
    cp -r $HOME/.local/state/nvim $HOME/.local/state/nvim-backup
    cp -r $HOME/.config/nvim $HOME/.config/nvim-backup
else
    echo \=\>\> "$choice" \<\<\= is not a valid configuration
    echo Usage:
    echo switch_config backup
    echo switch_config lazyvim
    echo switch_config nvchad
end
