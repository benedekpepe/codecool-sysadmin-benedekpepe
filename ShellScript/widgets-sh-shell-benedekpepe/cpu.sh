#!/bin/bash
cat /proc/cpuinfo | grep 'model name' | uniq
cat /proc/cpuinfo | grep 'cpu cores'
cat /proc/cpuinfo | grep 'MHz'