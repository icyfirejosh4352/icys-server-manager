#!/usr/bin/bash

# File with all commonly used ANSI escape sequences.
# Inspired by aristocratos/bashtop.

ALT_SCR_ON=$'\e[?1049h'
ALT_SCR_OFF=$'\e[?1049l'

HIDE_CURSOR=$'\e[?25l'
SHOW_CURSOR=$'\e[?25h'

CLR_SCR=$'\e[2J'

RST_CURSOR=$'\e[H'

TXT_RST=$'\033[0m'
TXT_BOLD=$'\033[1m'

C_BLUE=$'\033[38;2;137;180;250m'
C_GREEN=$'\033[38;2;160;255;100m'
C_YELLOW=$'\033[38;2;255;240;0m'
C_ORANGE=$'\033[38;2;240;120;0m'
C_RED=$'\033[38;2;255;0;0m'
C_TEAL=$'\033[38;2;0;255;255m'

#  ▂▃▄▅▆▇█ 
SPARK_CHARS=("_" "▂" "▃" "▄" "▅" "▆" "▇" "█")