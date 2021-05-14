#!/bin/bash
if [ -z $WIDGET_CONTROL]
    then
./mem.sh
./cpu.sh
    else
        for i in 1 2 3 4 5
        do  scriptName=$(echo $WIDGET_CONTROL | cut -d "," -f $i)
            bash $scriptName.sh
        done
    fi