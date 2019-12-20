#!/bin/bash

#=======================================#
# run with argument for single files.   #
# otherwise batch compiles current dir. #
#=======================================#

run() {
  timidity "$file" -Ow --output-file=- |\
  ffmpeg -i - -acodec libvorbis "${file%.*}.ogg"
}

if [ -n "$1" ]; then

  file="$1"
  run "$@"
  # added the sleeptime of two seconds,
  # since it happened to get output from
  # an earlier number getting rendered into
  # output of following file.
  # this might night to get adjusted
  sleep 2

else
  for file in *.midi; do
    run
  done
fi
