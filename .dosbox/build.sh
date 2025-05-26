#!/bin/bash

SCRIPT_DIR="$(cd $(dirname "${BASH_SOURCE[0]}") &> /dev/null && pwd)"
cd ${SCRIPT_DIR}

. inc/finddosbox.sh

cd ..

mkdir -p build
mkdir -p dist

export SDL_VIDEODRIVER=dummy

echo -n "Compiling... "
${DBOX_CMD} -conf .dosbox/conf/linux.conf -noconsole -c "BC /O /T picpuz.bas,build\picpuz.obj;" -c "exit" 2>&1 >/dev/null && echo "done" || { echo "failed"; echo "Press any key to continue..."; read -n 1 -s; exit 1; }

echo -n "Linking... "
${DBOX_CMD} -conf .dosbox/conf/linux.conf -noconsole -c "LINK build\picpuz.obj,dist\picpuz.exe;" -c "exit" 2>&1 >/dev/null && echo "done" || { echo "failed"; echo "Press any key to continue..."; read -n 1 -s; exit 1; }

echo -n "Copying Assets... "
cp -rf assets dist/assets && echo "done" || { echo "failed"; echo "Press any key to continue..."; read -n 1 -s; exit 1; }

sleep 2
