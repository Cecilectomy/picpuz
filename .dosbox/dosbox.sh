#!/bin/bash

type dosbox >/dev/null 2>&1 && $(which dosbox) -noconsole -conf .dosbox/dosbox.lin.conf && exit || { echo >&2 "DOSBox not found!"; }

read -p "Press Enter to continue"

