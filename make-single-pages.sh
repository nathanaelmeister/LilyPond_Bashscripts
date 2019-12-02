#!/bin/bash

# run in folder with input files:
# ./input-files/

for file in *.ily; do

  getnum=$(awk -F'_' '{print $2}' <<< "$file" |
             awk -F'.' '{print $1}' | sed 's/^0//g')

  filepath="../single-pages/${file}"

  cat <<-EOF > "$filepath"
	\version "2.18.2"

	#(set-default-paper-size "a4")
	#(set-global-staff-size 22)

	pieceNumber="$getnum"

	\include "../global-files/gitlink.ily"
	\include "../global-files/header.ily"

	\include "../input-files/${file}"

	EOF

done
