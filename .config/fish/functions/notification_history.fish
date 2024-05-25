function notification_history --wraps="makoctl history" --description "alias notification_history makoctl history"
    makoctl history | jq '{data}.[].[].[] | {"app-name": ."app-name".data, "body": .body.data, "summary": .summary.data}' | jq 'select(."app-name" != "notify-send" and ."app-name" != "Spotify")' | bat -l json $argv
end
