#!/bin/bash

# This script removes the first and last x seconds of every mp4 video inside the given directories.

# To use this script, you need to install ffmpeg. Try sudo apt install ffmpeg.

# USAGE: ./cut-mp4-video.sh /path/to/directory/with/video/files /more/paths/if/needed

DEPTH=3           # search depth for mp4 videos
CUT_FRONT=12      # Amount of seconds to cut from the beginning
CUT_BACK=12       # Amount of seconds to cut from the end

# iterate through each given directory
for directory in "$@"; do
  if [ -d "$directory" ]; then

    # iterate through each file with *.mp4 in directory. Max depth is given above.
    find "$directory" -maxdepth $DEPTH -type f -name '*.mp4' -print0 | 
    while IFS= read -r -d '' file; do
      # do not process file, if it is a cut version
      [[ "$file" == *.cut.mp4 ]] && continue
      printf 'Processing: %s\n' "$file"

      # gather new path and do not process, if output file exists
      new_path="$file.cut.mp4"
      [ -f "$new_path" ] && continue

      # gather duration of file
      duration=`ffprobe -i "$file" -show_entries format=duration -v quiet -of csv="p=0"`
      int_duration=`LC_ALL=C printf '%.0f' "$duration"`
      new_duration=`expr "$int_duration" - $CUT_FRONT - $CUT_BACK`

      # process file
      ffmpeg -ss $CUT_FRONT -i "$file" -to $new_duration -c copy "$new_path" -n -loglevel error < /dev/null
    done
  else
    echo "Does not exist, skipping: $directory \n"
  fi
done
