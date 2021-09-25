#!/usr/bin/env bash

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

WHOLE_SCREEN=""
AREA=""
WINDOW=""

OPTIONS="${WHOLE_SCREEN}\n${AREA}\n${WINDOW}"

CHOSEN="$(echo -e "${OPTIONS}" | rofi -theme "${SCRIPT_DIR}/screenshot.rasi" -p "App : scrot" -dmenu  -selected-row 1)"

case $CHOSEN in
    $WHOLE_SCREEN)
		if [[ -f /usr/bin/scrot ]]; then
			sleep 1; scrot 'Screenshot_%Y-%m-%d-%S_$wx$h.png' -e 'mv $f $$(xdg-user-dir PICTURES) ; viewnior $$(xdg-user-dir PICTURES)/$f'
		else
			msg
		fi
        ;;
    $AREA)
		if [[ -f /usr/bin/scrot ]]; then
			scrot -s 'Screenshot_%Y-%m-%d-%S_$wx$h.png' -e 'mv $f $$(xdg-user-dir PICTURES) ; viewnior $$(xdg-user-dir PICTURES)/$f'
		else
			msg
		fi
        ;;
    $WINDOW)
		if [[ -f /usr/bin/scrot ]]; then
			sleep 1; scrot -u 'Screenshot_%Y-%m-%d-%S_$wx$h.png' -e 'mv $f $$(xdg-user-dir PICTURES) ; viewnior $$(xdg-user-dir PICTURES)/$f'
		else
			msg
		fi
        ;;
esac