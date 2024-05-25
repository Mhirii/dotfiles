function Update --wraps='sudo pacman -Sy && sudo powerpill -Su && paru -Su' --description 'alias Update sudo pacman -Sy && sudo powerpill -Su && paru -Su'
    sudo pacman -Sy && sudo powerpill -Su && paru -Su $argv

end
