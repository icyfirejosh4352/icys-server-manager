#!/usr/bin/bash

# File with all commonly used ANSI escape sequences.
# Inspired by aristocratos/bashtop.

ALT_SCR_ON=$'\e[?1049h'
ALT_SCR_OFF=$'\e[?1049l'

HIDE_CURSOR=$'\e[?25l'
SHOW_CURSOR=$'\e[?25h'

CLR_SCR=$'\e[2J'

RST_CURSOR=$'\e[H'