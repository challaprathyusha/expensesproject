#!/bin/bash
USEDMEMORY=$(free -mt|tail -n 1|awk '{print$3F}')
TOTALMEMORY=$(free -mt|tail -n 1|awk '{print$2F}')
FREEMEMORY=$(free -mt|tail -n 1|awk '{print$4F}')
THRESHOLDMEMORY=500
date=$(date +%F-%H-%M-%S)

if [ $USEDMEMORY -ge $THRESHOLDMEMORY]
then
    echo "memory is reaching threshold where USEDMEMORY= $USEDMEMORY,THRESHOLDMEM=$THRESHOLDMEMORY"
else
    echo "As per DATE=$date used memory=$USEDMEMORY,totalmemory=$TOTALMEMORY and left with freememory of $FREEMEMOR"
fi

