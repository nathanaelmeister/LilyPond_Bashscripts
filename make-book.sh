#!/bin/bash

# run in parent directory. And select ${dir} directory
# like: `bash script.sh folder-with-infiles/`

dir="$1"
bookname="Sebastian_Lee_-_Op_70_-_40_easy_etudes.ly"

# parent=$(pwd | awk -F'/' '{print $NF}')
part=$( awk -F'-' '{print $NF}' <<< "$dir" |
        sed 's/\///g')

cat << EOF > "$bookname"
\version "2.18.2"

#(set-default-paper-size "a4")
#(set-global-staff-size 22)

\include "./global-files/gitlink.ily"

\include "./global-files/paper.ily"
\include "./global-files/pdf-header.ily"
\include "./global-files/tuplet-bow.ily"

\book {

  \include "./global-files/Nr_00-Frontpage.ily"
EOF

for file in ./${dir}/Nr_{01..40}-${part}.ily; do

  getnum=$(awk -F'_' '{print $2}' <<< "$file" |
             awk -F'.' '{print $1}' |
             awk -F'-' '{print $1}' |
             sed 's/^0//g' )


  # check if tuplet-bow is used and create `\include` line
  # and `\layout {}` if true

  tbincl=$(grep "TupletBracket" "$file")

  if [ -n "$tbincl" ]; then

    tblayout=$(cat <<-EOF
	\layout {
      \printTupletBow
    }
	EOF
    )
  else
    tblayout="\layout {}"
  fi

  cat << EOF

  %%%% Score Number: $getnum ==================================%%%%

  \score {
    \new StaffGroup = "" \with {
      instrumentName = \markup { \bold \huge { \larger "${getnum}." }}}
    <<
      \new Staff = "celloI" \with { midiInstrument = #"cello" }
      \include "${file}"
    >>
    $tblayout
  }
EOF
done >> "$bookname"

echo "}" >> "$bookname"

# ly -i indent "$bookname"

echo "...done :-)"
