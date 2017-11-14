# cut-mp4-videos

This bash script cuts the first and last X seconds of a mp4 video. The amount of seconds and the search depth
for video files is configurable. It is used to cut the RWTH Intro from the Designing Interactive Systems Lecture
of the RWTH Aachen University.
There is also a download script included which downloads all available videos into a directory of your choice.

# Usage


```
$ ./cut-mp4-video.sh /path/to/directory/with/video/files /more/paths/if/needed
```

It will then search recursivly (up to specified DEPTH, see configuration) for mp4 video files, cut them
and create the new file as ``*.cut.mp4``.


```
$ ./download-dis-videos.sh /path/to/directory/
```

This downloads the DIS Videos into ``/path/to/directory``

# Configuration

Just change the variables at the top of the script:

```
DEPTH=3           # search depth for mp4 videos
CUT_FRONT=12      # Amount of seconds to cut from the beginning
CUT_BACK=12       # Amount of seconds to cut from the end
```

# Dependencies

The script uses bash, ffmpeg and wget. Try installing via your packet manager.
