function Pac-keys --wraps='pacman-key --init; sudo pacman-key --populate archlinux' --description 'alias Pac-keys pacman-key --init; sudo pacman-key --populate archlinux'
  pacman-key --init; sudo pacman-key --populate archlinux $argv
        
end
