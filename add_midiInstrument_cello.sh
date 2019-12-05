#!/bin/bash

# script needs "celloI" se as instrument name
# then adds midiInstrument after that
# `\with { midiInstrument = #"cello" }`
#
# chanche "celloI" to match a different pattern 


for file in *.ly; do

  sed -i '/\"celloI\"/{s/$/\ \\with\ \{\ midiInstrument\ \=\ #\"cello\"\ \}/}' "$file"

done
 
