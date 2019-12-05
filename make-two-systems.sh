#!/bin/bash

# run in folder with input files: `./input-files-II/`
# for only processing single files, select `file `as first argument
# example with for-loop: `cd ./input-files-II/; bash script.sh`
# example with single file: `cd ./input-files-II/; bash script.sh infileII.ily`

exme() {

  num=$( awk -F'_' '{print $2}' <<< "$file" |
             awk -F'.' '{print $1}' |
             awk -F'-' '{print $1}' )

  # check if ${file//.ily/.ly} for replacing leading characters `^`
  getnum=$( sed 's/^0//g' <<< "$num" )

  parent=$(pwd | awk -F'/' '{print $NF}')

  # these seem to be unused, check for next version.
  # part=$(awk -F'-' '{print $NF}' <<< "$parent")
  # chname=${file//.ily/.ly}

  filepath="../single-pages-celloI_and_II/S_Lee_-_Op_70_-_I_u_II_Nr_${num}.ly"

  # check if tuplet-bow is used and create `\include` line
  # and `\layout {}` if true

  tbincl=$(grep "TupletBracket" "$file")

  if [ -n "$tbincl" ]; then

    tblink='\include "../global-files/tuplet-bow.ily"'

    tblayout=$(cat <<-EOF
	\layout {
	    \printTupletBow
	  }
	EOF
    )
  else
    tblayout="\layout {}"
  fi

  # print file:

  cat <<-EOF > "$filepath"
	\version "2.18.2"

	#(set-default-paper-size "a4")
	#(set-global-staff-size 22)

	pieceNumber="$getnum"

	\include "../global-files/gitlink.ily"
	\include "../global-files/header.ily"
	$tblink

	\paper {
	  system-system-spacing =
	  #'((basic-distance . 17)
	     (minimum-distance . 10)
	     (padding . 1)
	     (stretchability . 60))
	}

	\score {
	  \new StaffGroup = "" \with {
	    instrumentName = \markup { \bold \huge { \larger "${getnum}." }}
	  }
	  <<
	    \new Staff = "celloI" \with { midiInstrument = #"cello" }
	    \include "../input-files-celloI/Nr_${num}-celloI.ily"

	    \new Staff = "celloII" \with { midiInstrument = #"cello" }
	    \include "../${parent}/${file}"
	  >>
	  $tblayout
	  \midi {}
	  \header {
	    composer = "Sebastian Lee"
	    %opus = "Op. 70"
	  }
	}

	EOF

  # remove multible blank lines if needed:
  sed -i 'N;/^\n$/D;P;D;' "$filepath"
}

if [ -n "$1" ]; then

  file="$1"
  exme "$@"

  exit
fi

for file in *.ily; do

  exme

done

