#!/bin/bash

#=============================================================#
# run this after you added the second voice template in _WD/  #
# run script in projects `./` root directory:                 #
#                                                             #
# type in piece number (with leading zeros) as first argument #
# `$ bash script.sh 01` for adding `Score_Nr.01.ly`           #
#=============================================================#===#
#                                                                 #
# Your (W)orking (D)irectory: `./_WD`                             #
# needs to contain the following files:                           #
#                                                                 #
#  templ-1.ily (first part of LilyPond template file)             #
#  infile.ily  (your score, where bars and numbering to be added) #
#  templ-2.ily (second part of LilyPond template file)            #
#                                                                 #
# This script is highly destructive, handle with care!            #
#=================================================================#

nn="$1"

if [ -z "$nn" ]; then

  echo " no input number supplied!"
  echo " ==> quitting, without nothing done :-("
  exit

fi

cd _WD/ || exit

if [ -f ../_scripts/add_bar_numbers.sh ]; then

  bash ../_scripts/add_bar_numbers.sh

else
  echo
  echo "sorry, there is a script missing."
  echo "please file a bug report..."
  echo
  exit
fi

mv -i ./infile.ily "../input-files-celloII/Nr_${nn}-celloII.ily"

cd ../input-files-celloII/ || exit

bash ../_scripts/make-single-pages.sh "Nr_${nn}-celloII.ily"
bash ../_scripts/make-two-systems.sh "Nr_${nn}-celloII.ily"

# added a check on input file; this was higly needed ====#
#                                                        #
# at least to enter time signature and key:              #
nano -ET2 "../input-files-celloII/Nr_${nn}-celloII.ily"  #
#========================================================#

cd ../single-pages-celloI_and_II/ || exit

if [ -f "S_Lee_-_Op_70_-_I_u_II_Nr_${nn}.ly" ]; then

  lilypond "S_Lee_-_Op_70_-_I_u_II_Nr_${nn}.ly"

else
  echo "no LilyPond file!"
fi

if file "S_Lee_-_Op_70_-_I_u_II_Nr_${nn}.pdf"; then

  echo "file: S_Lee_-_Op_70_-_I_u_II_Nr_${nn}.pdf is present :-)"

  xpdf "S_Lee_-_Op_70_-_I_u_II_Nr_${nn}.pdf" &
  echo "opening..."

else
  echo "no pdf file!"
  exit
fi
