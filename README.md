# LilyPond - Bashscripts

This scripts repository belongs to [S. Lee; Op.70 (LilyPond)](https://github.com/nathanaelmeister/Lee-_Sebastian_-_Op.70_-_40_Easy_Etudes_for_Cello).
These scripts do not have any other purpose then being used within this [LilyPond - Repository](https://github.com/nathanaelmeister/Lee-_Sebastian_-_Op.70_-_40_Easy_Etudes_for_Cello)

This scripts purpose is to create the coresponding LilyPond compileable `ly`files:


- **make-book.sh**           # Creates the main Book.ly to be run in `root-directory`.
- **make-single-pages.sh**   # Creates the single-pages files for **PDF** and **MIDI** output,
                         # to be run in `input-files` folder.
- **make-two-systems.sh**    # Creates the single-pages files with two voices for PDF and MIDI output,
                         # to be run in `input-files` folder.

This two scripts only purpose is to strip a `\relative {` block off a `\score` block (handle with care!!!)

```
- extract-relative-loop.sh
- extract-relative.sh
```

Just storage for a `sed` command.

`- add_opus.sh`

Not yet written:

`- select-pages.sh`
