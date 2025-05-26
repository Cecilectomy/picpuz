#!/bin/bash

SCRIPT_DIR="$(cd $(dirname "${BASH_SOURCE[0]}") &> /dev/null && pwd)"
cd ${SCRIPT_DIR}

. inc/finddosbox.sh

cd ..

echo "Running DOSBox..."
${DBOX_CMD} -noconsole -conf .dosbox/conf/linux.conf 2>&1 >/dev/null
