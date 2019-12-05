#!/bin/bash

#=============================================================#
# run this after you added the second voice template          #
# in projects `./` root directory:                            #
#                                                             #
# type in piece number (with leading zeros) as first argument #
# `$ bash script.sh 01` for adding `Score_Nr.01.ly`           #
#=============================================================#

nn="$1"

cd _WD/ || exit
bash "$HOME/Dokumente/Command-Line/MyScripts/Lilypond/Bar-Numbers/simpler-4.sh"

mv ./infile.ily "../input-files-celloII/Nr_${nn}-celloII.ily"

cd ./input-files-celloII/ || exit

bash ../_scripts/make-single-pages.sh
bash ../make-two-systems.sh

cd ../single-pages-celloI_and_II/ || exit

lilypond "./S_Lee_-_Op_70_-_I_u_II_Nr_${nn}.ly"

if file "./S_Lee_-_Op_70_-_I_u_II_Nr_${nn}.pdf"; then

  echo "file: ./S_Lee_-_Op_70_-_I_u_II_Nr_${nn}.pdf is present :-)"

  xpdf "./S_Lee_-_Op_70_-_I_u_II_Nr_${nn}.pdf" &
  echo "opening..."

  exit
fi
