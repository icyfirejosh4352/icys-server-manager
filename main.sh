#!/usr/bin/bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

#shellcheck source=/dev/null
source "$SCRIPT_DIR"/lib/ui.sh

cleanup ()
{
    stty echo
    printf '\e[?1049l\e[?25h'
    exit
}

trap 'cleanup' INT EXIT TERM

# save previous screen
printf '\e[?1049h'

# clear screen
printf '\e[2J\e[3J\e[H'

# hide cursor
printf '\e[?25l'

#stop displaying user input
stty -echo

# printf '\x1b[48;5;16m'

SLEEP_TIME=0.5

# main loop
while : ; do 

ui_draw_box 0 0 4 4


sleep $SLEEP_TIME 

done



# restore previous screen
printf '\e[?1049l'