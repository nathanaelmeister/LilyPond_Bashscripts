# LilyPond - Bashscripts

This scripts repository belongs to [S. Lee; Op.70 (LilyPond)](https://github.com/nathanaelmeister/Lee-_Sebastian_-_Op.70_-_40_Easy_Etudes_for_Cello).
These scripts do not have any other purpose then being used within this [LilyPond - Repository](https://github.com/nathanaelmeister/Lee-_Sebastian_-_Op.70_-_40_Easy_Etudes_for_Cello)

This scripts purpose is to create the coresponding LilyPond compileable `ly`files:


- **make-book.sh**           # Creates the main Book.ly to be run in `root-directory`. Run like: `bash make-book.sh ./infiles/`
- **make-single-pages.sh**   # Creates the single-pages files for **PDF** and **MIDI** output,
                         # to be run in `input-files` folder.
- **make-two-systems.sh**    # Creates the single-pages files with two voices for PDF and MIDI output,
                         # to be run in `input-files` folder of second voice.

______________________________________________________________________________

## Update 0.0.2-15

The first three script runs described below are automated within the new

  **run.sh** script.

The usage is pretty straight forward:

- first create you _WD/infile.ily with your notes within the `\relative {` block, but without the relative. One line for one bar.
- second run the script like this: `bash run.sh NN` while `NN` is the piece number, use leading zeros.
- that is basicaly it. Everything else should run automated.
- well there is one *bug*, but I'm sure you'll find it out yourself *:-)*
______________________________________________________________________________

## Usage:

**1.) Script-run:** `bash make-single-pages.sh` in `./input-files-voiceI./`

```
├── input-files-voiceI     make-single-pages.sh  ├── single-pages-voiceI   
│   ├── Nr_01-voiceI.ily   ===================>  │   ├── Score-Nr_01-voiceI.ly
│   ├── Nr_02-voiceI.ily   ===================>  │   ├── Score-Nr_02-voiceI.ly
│   └── Nr_03-voiceI.ily   ===================>  │   └── Score-Nr_03-voiceI.ly
```

**2.) Script-run:** `bash make-single-pages.sh` in `./input-files-voiceII/`

```
├── input-files-voiceII     make-single-pages.sh  ├── single-pages-voiceII
│   ├── Nr_01-voiceII.ily   ===================>  │   ├── Score-Nr_01-voiceII.ly
│   ├── Nr_02-voiceII.ily   ===================>  │   ├── Score-Nr_02-voiceII.ly
│   └── Nr_03-voiceII.ily   ===================>  │   └── Score-Nr_03-voiceII.ly
```

**3.) Script-run:** `bash make-two-pages.sh` in `./input-files-voiceII/`

```
├── input-files-voiceII     make-two-systems.sh   ├── single-pages-voiceI_a_II
│   ├── Nr_01-voiceI.ily    ===================>  │   ├── Score-Nr_01-voiceI_a_II.ly
│   ├── Nr_02-voiceI.ily    ===================>  │   ├── Score-Nr_02-voiceI_a_II.ly
│   └── Nr_03-voiceI.ily    ===================>  │   └── Score-Nr_03-voiceI_a_II.ly
├── input-files-voiceII     ===================>  │
│   ├── Nr_01-voiceII.ily   ===================>  │
│   ├── Nr_02-voiceII.ily   ===================>  │
│   └── Nr_03-voiceII.ily   ===================>  │
```

**4.) Script-run:** `bash make-book.sh` in `./`

```
├── input-files-voiceI      make-book.sh         ├─ Book.ly
│   ├── Nr_01-voiceI.ily    ===================> │
│   ├── Nr_02-voiceI.ily    ===================> │
│   └── Nr_03-voiceI.ily    ===================> │
├── input-files-voiceII     ===================> │
│   ├── Nr_01-voiceII.ily   ===================> │
│   ├── Nr_02-voiceII.ily   ===================> │
│   └── Nr_03-voiceII.ily   ===================> │
```
______________________________________________________________________________


This two scripts only purpose is to strip a `\relative {` block off a `\score` block (handle with care!!!)

```
- extract-relative-loop.sh
- extract-relative.sh
```

Just storage for a `sed` command.

`- add_opus.sh`

Not yet written:

`- select-pages.sh`
