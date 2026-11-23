#!/usr/bin/bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

#shellcheck source=/dev/null
source "$SCRIPT_DIR"/lib/ui.sh
#shellcheck source=/dev/null
source "$SCRIPT_DIR"/lib/ansi.sh

cleanup ()
{
    stty echo
    # switch out of alternate screen buffer.
    printf '%s' "$ALT_SCR_OFF"
    exit
}

trap 'cleanup' INT EXIT TERM

# switch to alternate buffer.
printf '%s' "$ALT_SCR_ON"

# clear screen and move cursor to (1,1)
printf '%s%s' "$CLR_SCR" "$RST_CURSOR"

# hide cursor
printf '%s' "$HIDE_CURSOR"

#stop displaying user input
stty -echo

# printf '\x1b[48;5;16m'

SLEEP_TIME=0.5
read -r HEIGHT WIDTH < <(stty size)
# main loop
while : ; do 
#   main frame that is flushed to display at the end of every cycle.
    FRAME=""

    printf '\e[2J\e[3J\e[H'

    ui_draw_box 1 1 "$WIDTH" "$HEIGHT" 1


    sleep $SLEEP_TIME 

done



# restore previous screen
printf '\e[?1049l'