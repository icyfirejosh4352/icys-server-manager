#!/usr/bin/bash

ui_draw_box()
{
    local ROW=$1
    local COL=$2
    local WIDTH=$3
    local HEIGHT=$4

    # top left corner
    printf "\033[%d;%dHX" "$ROW" "$COL" # ┌

    # top edge print loop
    local count=0
    while [ $count -lt $((WIDTH - 2)) ]; do
        printf "\033[%d;%dH0" "$ROW" "$((COL + 1 + count))" # ─
        ((count++))
    done
    printf "\033[%d;%dHX" "$ROW" "$((COL + WIDTH))" # ┐

    local count=0
    while [ $count -lt $((HEIGHT - 2)) ]; do
        printf "\033[%d;%dH0" "$((ROW + 1 + count))" "$COL" # │

        local countb=0
        while [ $countb -lt $((WIDTH - 2)) ]; do
            printf "\033[%d;%dH " "$((ROW + 1 + count))" "$((COL + 2 + countb))"
            ((countb++))
        done
        printf "\033[%d;%dH0" "$((ROW + 1 + count))" "$((COL + 1 + WIDTH))" # │

        ((count++))
    done

    printf "\033[%d;%dHX" "$((ROW + HEIGHT))" "$COL" # └
    local count=0
    while [ $count -lt $((WIDTH - 2)) ]; do
        printf "\033[%d;%dH0" "$((ROW + HEIGHT))" "$((COL + 1 + count))" # ─
        ((count++))
    done
    printf "\033[%d;%dHX" "$((ROW + HEIGHT))" "$((COL + WIDTH))" # ┘
    return
}