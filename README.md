# PICPUZ #

Old QuickBASIC/QBasic picture scramble game.

I originally wrote this in the early 2000's when I was first getting in to programming. TI83 and QuickBASIC were my entry into programming, and this was one of the first things I coded. I have re-organized and cleaned up the code, but it is 99% the original code.

## How To Play ##

Picture is cut into 9 tiles with 1 removed and scrambled. Shift the tiles around into the empty space to unscramble and complete the picture.

- **ESC** - Quit the game
- **R** - Re-scramble the picture and reset move count
- **W** - Shift tile up into the empty space (from below)
- **A** - Shift tile to the right into the empty space (from the left)
- **S** - Shift tile down into the empty space (from above)
- **D** - Shift tile to the left into the empty space (from the right)

## Building ##

If you are using old hardware and have QB available, you can open the source in QB and/or compile using BC and LINK manually.

### Using DOSBox ###

- Install DOSBox (https://www.dosbox.com) or DOSBox-x (https://dosbox-x.com) and add the installed path to the system PATH
  - On Windows, if you don't add the installation path to PATH, the following scripts will look in the common default install locations as a fallback
    - Looks for dosbox-x and fallback location first, and then for dosbox and fallback location.
  - On Linux, the scripts expect dosbox to be installed and callable (on the PATH) and will not fallback to any common locations as a fallback
    - expects dosbox to be installed, does not try dosbox-x
- Obtain and add QuickBASIC 4.5
  - Windows
    - Place files at C:\DOS\qb45
  - Linux
   - Place files at ~/DOS/qb45
- Run the included `.dosbox/build.bat` (windows) or `.dosbox/build.sh` (linux) to build the program
- Run the included `.dosbox/dosbox.bat` (windows) or `.dosbox/dosbox.sh` (linux) to enter dosbox and run QB, BC, LINK, etc manually

### Using QB64PE

- Install QB64PE (https://www.qb64phoenix.com/)
- Open the source .bas in the QB64 / QB64PE editor and run or compile.
- Alternatively you can compile from the command line using the `-c`, and optionally the `-o`, options. e.g. `qb64pe -c yourfile.bas -o outputname.exe`
