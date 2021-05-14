#!/bin/bash
diskUsed=0
diskFree=0

for row in $(df | tail -n +2 | tr -s " " | cut -d " " -f3)
    do diskUsed=$(($diskUsed + $row))
    done
diskUsed=$(($diskUsed / 1024 / 1024))

for row2 in $(df | tail -n +2 | tr -s " " | cut -d " " -f4)
    do diskFree=$(($diskFree + $row2))
    done
diskFree=$(($diskFree / 1024 / 1024))

diskTotal=$(($diskFree + $diskUsed))
diskPercent=$(($diskUsed * 100 / $diskTotal))


echo "Amount of total disk space: $diskTotal MB"
echo "Amount of free disk space: $diskFree MB"
echo "Percentage of used disk space: $diskPercent%"