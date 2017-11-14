#!/bin/bash

for directory in "$@"; do
  if [ -d "$directory" ]; then

    cd $directory

    # get list of videos:
    wget --quiet -O - http://hci.rwth-aachen.de/dis_videos | grep -oP '(?<=href=")[^"]*(?=")' | grep ".mp4" |

    while read -r file; do
      # extract filename
      filename=$(echo "$file" | egrep -o '[^\/]*\.mp4$' | egrep -o '[^\-]*$')
      echo "Downloading: $filename";

      wget -nc -q --show-progress -O "$filename" "$file"
    done
  fi
done
