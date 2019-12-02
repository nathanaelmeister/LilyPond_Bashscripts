#!/bin/bash

#folder="$1"
bookname="Sebastian_Lee_-_Op_70_-_40_easy_etudes.ly"
book=$(sed 's/\///g' <<< "$bookdir")

cat << EOF > "$bookname"
\version "2.18.2"

#(set-default-paper-size "a4")
#(set-global-staff-size 22)

\include "./global-files/gitlink.ily"

\include "./global-files/paper.ily"
\include "./global-files/pdf-header.ily"

\book {
EOF

for file in ./input-files/*.ily; do
    echo "  \include \"$file\""
done >> "$bookname"

echo "}" >> "$bookname"

# ly -i indent "$bookname"

echo "...done :-)"
