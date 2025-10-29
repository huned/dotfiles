#!/bin/bash

# Dependencies: xprintidle, imagemagick, sha256sum

SAVE_DIR="${HOME}/Pictures/Screenshots/autocap"
HASH_DIR="${SAVE_DIR}/.hashes"

mkdir -p "${SAVE_DIR}"
mkdir -p "${HASH_DIR}"

# The main loop that takes screenshots every 10 minutes
while true
do
  # Check if the desktop session has been active within the last 10 minutes
  if [[ $(xprintidle) -lt 600000 ]]; then
    # Take the screenshot if the session is active
    filename="${SAVE_DIR}/autocap-$(date +%F-%T).png"
    import -window root $filename

    # Calculate the hash of the file contents using sha256sum
    file_hash=$(sha256sum "$filename" | awk '{ print $1 }')

    # Check if a file with the same hash already exists
    if [ -f "${HASH_DIR}/${file_hash}" ]; then
      # Remove the duplicate file
      rm "$filename"
    else
      # Create a file with the hash as the filename to mark it as a duplicate
      touch "${HASH_DIR}/${file_hash}"
    fi

    # Delete all images that are older than five years
    find "${SAVE_DIR}" -type f -mtime +1825 -delete
  fi

  # Wait for 10 minutes before taking another screenshot
  sleep 600
done

