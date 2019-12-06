#!/bin/bash

#=============================================================#
# run this after you added the second voice template          #
# in projects `./` root directory:                            #
#                                                             #
# type in piece number (with leading zeros) as first argument #
# `$ bash script.sh 01` for adding `Score_Nr.01.ly`           #
#=============================================================#

nn="$1"

if [ -z "$nn" ]; then

  echo " no input number supplied!"
  echo " ==> quitting, without nothing done :-("
  exit

fi

ext="$HOME/Dokumente/Command-Line/MyScripts/Lilypond/Bar-Numbers/simpler-4.sh"

cd _WD/ || exit

if [ -f "$ext" ]; then

  bash "$ext"

else
  echo
  echo "sorry, there is a script missing."
  echo "please file a bug report..."
  echo
  exit
done

mv -i ./infile.ily "../input-files-celloII/Nr_${nn}-celloII.ily"

cd ../input-files-celloII/ || exit

bash ../_scripts/make-single-pages.sh "Nr_${nn}-celloII.ily"
bash ../_scripts/make-two-systems.sh "Nr_${nn}-celloII.ily"

# added a check on input file; this higly needed ========#
#                                                        #
# to enter time signature and key:                       #
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
