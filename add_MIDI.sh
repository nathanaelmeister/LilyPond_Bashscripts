#!/bin/bash

# adding a `\midi` block behind the `\layout` block
# usng two spaces of indentation:

for file in *.ly; do

  sed -i '/layout/{s/$/\n\ \ \\midi\ {}/}' "$file"

done
