#!/bin/bash

SAVE_PATH="./"
TMP_PATH="/tmp/"
OUTPUT_FILE="wallpaper.jpg"
RESOLUTION="1920x1080"
URL="https://picsum.photos/1920/1080"

usage() {
  echo "Usage: $0 [ -p PATH | -t ] [ -o FILENAME ] [ -r RESOLUTION ]"
  echo "       -p to save image on a specific path."
  echo "       -t to save image in /tmp."
  echo "       -o to save image with a specific name."
  echo "       -r to set a custom resolution for the image."
  echo "Example: $0 -p ~/Desktop -o my-wallpaper -r 1300x720"
  exit 1
}

while getopts "p:to:r:h" opt; do
  case $opt in
    p)
      SAVE_PATH="$OPTARG"
      ;;
    t)
      SAVE_PATH="$TMP_PATH"
      ;;
    o)
      OUTPUT_FILE="$OPTARG"
      ;;
    r)
      RESOLUTION="$OPTARG"
      ;;
    h)
      usage
      ;;
    \?)
      echo "Invalid option: -$OPTARG" >&2
      usage
      ;;
  esac
done

if ! curl -sL "$URL" -o "$SAVE_PATH/$OUTPUT_FILE"; then
  echo "Error: Failed to download the image from $URL"
  exit 1
fi

echo "Image downloaded and saved to: $SAVE_PATH/$OUTPUT_FILE"

