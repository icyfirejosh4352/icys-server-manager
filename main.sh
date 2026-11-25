#!/usr/bin/bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

#shellcheck source=/dev/null
source "$SCRIPT_DIR"/lib/ui.sh
#shellcheck source=/dev/null
source "$SCRIPT_DIR"/lib/ansi.sh
#shellcheck source=/dev/null
source "$SCRIPT_DIR"/lib/itop.sh
cleanup ()
{
    stty echo
    # switch out of alternate screen buffer.
    printf '%s' "$ALT_SCR_OFF"
    exit
}

trap 'cleanup' INT EXIT TERM

prev_total=0
prev_idle=0

while IFS=':' read -r key value; do
    if [[ "$key" == "model name"* ]]; then
        model_name=${value# }
        break
    fi
done < /proc/cpuinfo

# switch to alternate buffer.
printf '%s' "$ALT_SCR_ON"

# clear screen and move cursor to (1,1)
printf '%s%s' "$CLR_SCR" "$RST_CURSOR"

# hide cursor
printf '%s' "$HIDE_CURSOR"

#stop displaying user input
stty -echo

# printf '\x1b[48;5;16m'

itop_init

SLEEP_TIME=0.6
# read -r HEIGHT WIDTH < <(stty size)
# main loop
while : ; do 
    read -r HEIGHT WIDTH < <(stty size)
#   main frame that is flushed to display at the end of every cycle.
    FRAME=""

    printf '\e[2J\e[3J\e[H'

    ui_draw_box 1 1 "$WIDTH" "$HEIGHT" 1 $C_RED
#    ui_draw_box 2 2 "$((WIDTH/2))" "$((HEIGHT/2))" 2 $C_TEAL
    #ui_draw_text_at "█GREEN█" 3 3 $C_GREEN
    #ui_draw_text_at "█YELLOW█" 3 10 $C_YELLOW
    #ui_draw_text_at "█ORANGE█" 3 18 $C_ORANGE
    #ui_draw_text_at "█RED█" 3 26 $C_RED
    #ui_draw_text_at "█TEAL█" 3 31 $C_TEAL
#    ui_draw_box 8 8 10 10 1

    ui_draw_text_at "[ISM v0.0001]" 1 "$(((WIDTH/2) - 6))"

    itop_main 3 3 "$((WIDTH/2))" "$((HEIGHT/4))"

    # final frame pushed to display
    printf "%s" "$FRAME"

    sleep $SLEEP_TIME 

done

# restore previous screen
printf '\e[?1049l'