#!/usr/bin/bash

ui_draw_box() {
    local ROW=$1
    local COL=$2
    local WIDTH=$3
    local HEIGHT=$4
    local TYPE=$5
    local COLOUR=$6

    local chunk=""
    chunk+=$COLOUR

    case $TYPE in
        1)
    #   top left corner
        printf -v string "\033[%d;%dH┌" "$ROW" "$COL"
        chunk+=$string
    #   top edge draw loop
    #        printf -v string "\033[%d;%dH─" "$ROW" "$((COL + 1))"
        local count=0
    #   the "-2" for width accounts for corners.    
        while [ $count -lt $((WIDTH - 2)) ]; do
    #       the "+1" in the column calc skips the first corner.
    #       printf -v string "\033[%d;%dH─" "$ROW" "$((COL + 1 + count))"
            string+="─"
            ((count++))
        done
        chunk+=$string
    #   top right corner    
        chunk+="┐"
        # printf -v chunk "\033[%d;%dH┐" "$ROW" "$((COL + WIDTH - 1))"

    #   main body draw loop
        local count=0
    #   again, "-2" here accounts for corners, the top and bottom ones this time.    
        while [ $count -lt $((HEIGHT - 2)) ]; do
    #       prints left edge of respective row    
            printf -v string "\033[%d;%dH│" "$((ROW + 1 + count))" "$COL"
            chunk+=$string
    #       prints right edge of respective row
            printf -v string "\033[%d;%dH│" "$((ROW + 1 + count))" "$((COL + WIDTH - 1))"
            chunk+=$string
            ((count++))
        done

    #   prints bottom left corner
        printf -v string "\033[%d;%dH└" "$((ROW + HEIGHT - 1))" "$COL"
        chunk+=$string
        #printf -v string "\033[%d;%dH─" "$((ROW + HEIGHT - 1))" "$((COL + 1))"
        #chunk+=$string
    #   bottom edge draw loop    
        local count=0
        while [ $count -lt $((WIDTH - 2)) ]; do
            # printf "\033[%d;%dH─" "$((ROW + HEIGHT - 1))" "$((COL + 1 + count))"
            chunk+="─"
            ((count++))
        done
    #   prints bottom right corner
        # printf -v string "\033[%d;%dH┘" "$((ROW + HEIGHT - 1))" "$((COL + WIDTH - 1))"
        chunk+="┘"
        ;;
        2)
        printf -v string "\033[%d;%dH╔" "$ROW" "$COL"
        chunk+=$string
        local count=0
        while [ $count -lt $((WIDTH - 2)) ]; do
        #    printf "\033[%d;%dH═" "$ROW" "$((COL + 1 + count))"
            string+="═"
            ((count++))
        done
        chunk+=$string
        chunk+="╗"
        #printf "\033[%d;%dH╗" "$ROW" "$((COL + WIDTH - 1))"

        local count=0
        while [ $count -lt $((HEIGHT - 2)) ]; do
            printf -v string "\033[%d;%dH║" "$((ROW + 1 + count))" "$COL"
            chunk+=$string
            printf -v string "\033[%d;%dH║" "$((ROW + 1 + count))" "$((COL - 1 + WIDTH))"
            chunk+=$string
            ((count++))
        done
        
        #chunk+="╚"
        printf -v string "\033[%d;%dH╚" "$((ROW + 1 + count))" "$COL"    
        chunk+=$string
        local count=0
        while [ $count -lt $((WIDTH -2 )) ]; do
            chunk+="═"
            # printf "\033[%d;%dH═" "$((ROW + HEIGHT - 1))" "$((COL + 1 + count))"
            ((count++))
        done
        chunk+="╝"
        #printf "\033[%d;%dH╝" "$((ROW + HEIGHT - 1))" "$((COL + WIDTH - 1))" 
        ;;
    esac
    chunk+=$TXT_RST
    FRAME+=$chunk
    return
}

# ui_open_transition()
# {
#     local WIDTH=$1
#     local HEIGHT=$2


# }

ui_draw_text_at ()
{
    local STR=$1
    local ROW=$2
    local COL=$3
    local COLOUR=$4

    local string=""
    printf -v string "\033[%d;%dH%s%s%s" "$ROW" "$COL" "$COLOUR" "$STR" "$TXT_RST"
    FRAME+=$string
    return
}