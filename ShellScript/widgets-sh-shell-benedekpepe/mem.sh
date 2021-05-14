#!/bin/sh
cat /proc/meminfo | grep 'MemFree'
cat /proc/meminfo | grep 'MemTotal'