#!/bin/bash

# make sure you have: xprintidle, imagemagick

SAVE_DIR="$HOME/Pictures/Screenshots/autocap"
mkdir -p "${SAVE_DIR}"

# The main loop that takes screenshots every 10 minutes
while true
do
  # Check if the desktop session has been active within the last 10 minutes
  if [[ $(xprintidle) -lt 600000 ]]; then
    # Take the screenshot if the session is active
    filename="${SAVE_DIR}/autocap-$(date +%F-%T).png"
    import -window root $filename

    # Delete all images that are older than one year
    find "${SAVE_DIR}" -type f -mtime +365 -delete
  fi

  # Wait for 10 minutes before taking another screenshot
  sleep 600
done

