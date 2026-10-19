
if status is-interactive 

    abbr -a v "nvim"
    abbr -a e "exit"
    abbr -a c "clear"
    abbr -a t "tmux"

    abbr -a j "z"
    abbr -a m "neomutt"

    abbr -a leet "nvim -c Leet"

    if type -q eza 
        abbr -a l "eza -lh"
        abbr -a lt "eza --tree -A --group-directories-last"
    else
        abbr -a l  "ls -lhF"
        abbr -a lt "tree --filesfirst"
    end

    abbr -a lg "lazygit"
    abbr -a ghd "gh dash"

    abbr -a o 'xdg-open'

    if command -v pacman >/dev/null then
        if command -v paru >/dev/null then
            abbr -a p "paru"
        else 
            abbr -a p "sudo pacman"
        end
    end

    abbr -a d "docker"
    abbr -c docker c "compose"
    abbr -c docker b -- "--build"

    # Weirdest abbriviations 
    abbr -a :q "exit"
    abbr -a :qa "exit"

end
