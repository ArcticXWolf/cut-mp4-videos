# cut-mp4-videos

This bash script cuts the first and last X seconds of a mp4 video. The amount of seconds and the search depth
for video files is configurable.

# Usage


```
$ ./cut-mp4-video /path/to/directory/with/video/files /more/paths/if/needed
```

It will then search recursivly (up to specified DEPTH, see configuration) for mp4 video files, cut them
and create the new file as ``*.cut.mp4``.

# Configuration

Just change the variables at the top of the script:

```
DEPTH=3           # search depth for mp4 videos
CUT_FRONT=12      # Amount of seconds to cut from the beginning
CUT_BACK=12       # Amount of seconds to cut from the end
```

# Dependencies

The script uses bash and ffmpeg. Try installing via your packet manager.
