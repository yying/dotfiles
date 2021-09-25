#!/usr/bin/env bash

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

rofi -no-lazy-grab -show drun -modi drun -theme "${SCRIPT_DIR}/launcher.rasi"