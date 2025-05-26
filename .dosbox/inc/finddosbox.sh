#!/bin/bash

echo -n "Looking for DOSBox... "

type dosbox >/dev/null 2>&1 && export DBOX_CMD="dosbox"

if [[ -z ${DBOX_CMD+x} ]]; then
    echo "not found!"
    echo "Press any key to continue..."
    read -n 1 -s
    exit 1
else
    echo "found! (${DBOX_CMD})"
fi
