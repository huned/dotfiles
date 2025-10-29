#!/bin/bash

# Dependencies: imagemagick

function cleanup {
    echo "Exiting..."
    exit 1
}

trap cleanup INT

DIR="$1"
NUM_DAYS=1825

for DAYS_AGO in $(seq ${NUM_DAYS}); do
  DATE=$(date -d "${DAYS_AGO} days ago" +%Y-%m-%d)

  ANIMATED_FILE="${DIR}/animate-${DATE}.gif"

  if [ -f "${ANIMATED_FILE}" ]; then
    # already exists
    echo "${DATE} exists, skipping."
  else
    FILE_COUNT=$(ls ${DIR}/*-${DATE}-*.png 2>/dev/null | wc -l)

    if [[ ${FILE_COUNT} -gt 1 ]]; then
      # identify -list resource
      convert -limit memory 2GB -limit map 4GB -limit disk 8GB -resize 30% +repage -delay 100 -loop 0 "${DIR}/*-${DATE}-*.png" "$ANIMATED_FILE"
      echo "${DATE} OK"
    fi
  fi
done
