#!/bin/bash

if [ "$1" = "--help" ] || [ "$1" = "-h" ]; then

  cat <<-EOF

	  run this script in your working directory
	  containing the following files:

	    templ-1.ily (first part of LilyPond template file)
	    infile.ily  (your score, where bars and numbering to be added)
	    templ-2.ily (second part of LilyPond template file)

	  this script is highly destructive, handle with care!

	EOF
  exit
fi

file1="templ-1.ily"
file2="infile.ily"
file3="templ-2.ily"

while read -r line; do
  if [ -z "$line" ]; then
    echo
    continue
  fi
  printf '%s@| %%%.2d\n' "$line" "$((++n))"
done < "$file2" | column -e -s'@' -t | sed 's/ |/|/' > /tmp/output.txt

cat "$file1" /tmp/output.txt "$file3" > "$file2"

ly -i indent "$file2"

echo
echo "...done :-)"
echo
