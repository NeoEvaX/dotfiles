#!/bin/bash

# Goes in the /usr/local/bin folder
# Directory containing the images
IMG_DIR=~/.warp/themes/HomeBackgrounds

# Get a random image from the directory
random_image=$(find ~/.warp/themes/HomeBackgrounds -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.JPEG" \) | /opt/homebrew/bin/gshuf -n 1)

cp ${random_image} "${random_image%/*}/1.jpg" 
