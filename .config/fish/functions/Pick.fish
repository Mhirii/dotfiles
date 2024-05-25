function Pick --wraps='gpick -p -s -o | copyq add - ; copyq select 0' --description 'alias Pick gpick -p -s -o | copyq add - ; copyq select 0'
  gpick -p -s -o | copyq add - ; copyq select 0 $argv
        
end
