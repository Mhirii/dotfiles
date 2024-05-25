function ngrok_ssh --wraps='ngrok tcp 22' --description 'alias ngrok_ssh ngrok tcp 22'
  ngrok tcp 22 $argv
        
end
