#!/bin/bash

# ATTENTION; this script workls highly destructive
# remove `-i` for inplace editing to print to STDOUT
# run in 'input-files' directory

for file in *.ly; do

  sed -i '/composer/{s/$/\n    \%opus \= \"Op. 70\"/}' "$file"

done
