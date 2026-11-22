#!/usr/bin/bash

ui_draw_box()
{
    local ROW=$1
    local COL=$2
    local WIDTH=$3
    local HEIGHT=$4
    local TYPE=$5

    case $TYPE in
        1)
    #   top left corner
        printf "\033[%d;%dH┌" "$ROW" "$COL"

    #   top edge draw loop
        local count=0
    #   the "-2" for width accounts for corners.    
        while [ $count -lt $((WIDTH - 2)) ]; do
    #       the "+1" in the column calc skips the first corner.
            printf "\033[%d;%dH─" "$ROW" "$((COL + 1 + count))"
            ((count++))
        done
    #   top right corner    
        printf "\033[%d;%dH┐" "$ROW" "$((COL + WIDTH - 1))"

    #   main body draw loop
        local count=0
    #   again, "-2" here accounts for corners, the top and bottom ones this time.    
        while [ $count -lt $((HEIGHT - 2)) ]; do
    #       prints left edge of respective row    
            printf "\033[%d;%dH│" "$((ROW + 1 + count))" "$COL"

    #       inner loop for printing 
            # local countb=0
            # while [ $countb -lt $((WIDTH - 2)) ]; do
            #     printf "\033[%d;%dH " "$((ROW + 1 + count))" "$((COL + 2 + countb))"
            #     ((countb++))
            # done
            # UNNECESSARY

    #       prints right edge of respective row
            printf "\033[%d;%dH│" "$((ROW + 1 + count))" "$((COL + WIDTH - 1))"

            ((count++))
        done

    #   prints bottom left corner
        printf "\033[%d;%dH└" "$((ROW + HEIGHT - 1))" "$COL"
    #   bottom edge draw loop    
        local count=0
        while [ $count -lt $((WIDTH - 2)) ]; do
            printf "\033[%d;%dH─" "$((ROW + HEIGHT - 1))" "$((COL + 1 + count))"
            ((count++))
        done
    #   prints bottom right corner
        printf "\033[%d;%dH┘" "$((ROW + HEIGHT - 1))" "$((COL + WIDTH - 1))" ;;

        2)
        printf "\033[%d;%dH╔" "$ROW" "$COL"
        local count=0
        while [ $count -lt $((WIDTH - 2)) ]; do
            printf "\033[%d;%dH═" "$ROW" "$((COL + 1 + count))"
            ((count++))
        done
        printf "\033[%d;%dH╗" "$ROW" "$((COL + WIDTH - 1))"

        local count=0
        while [ $count -lt $((HEIGHT - 2)) ]; do
            printf "\033[%d;%dH║" "$((ROW + 1 + count))" "$COL"
            printf "\033[%d;%dH║" "$((ROW + 1 + count))" "$((COL - 1 + WIDTH))"
            ((count++))
        done
        
        printf "\033[%d;%dH╚" "$((ROW + 1 + count))" "$COL"    
        
        local count=0
        while [ $count -lt $((WIDTH -2 )) ]; do
            printf "\033[%d;%dH═" "$((ROW + HEIGHT - 1))" "$((COL + 1 + count))"
            ((count++))
        done

        printf "\033[%d;%dH╝" "$((ROW + HEIGHT - 1))" "$((COL + WIDTH - 1))" ;;
    esac
    return
}