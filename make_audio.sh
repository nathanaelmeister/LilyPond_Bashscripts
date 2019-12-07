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

else
  for file in *.midi; do
    run
  done
fi
