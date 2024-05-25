function FD --wraps='fd --base-directory ~ --absolute-path --hidden' --description 'alias FD fd --base-directory ~ --absolute-path --hidden'
  fd --base-directory ~ --absolute-path --hidden $argv
        
end
