#!/bin/bash

SOURCE_SCRIPT="./wallpaper.sh"
DESTINATION_SCRIPT="$HOME/wallpaper.sh"

cp "$SOURCE_SCRIPT" "$DESTINATION_SCRIPT"

(crontab -l ; echo "* * * * * $DESTINATION_SCRIPT") | crontab -

echo "Cron job set up successfully to run every minute."
