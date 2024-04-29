#!/bin/bash
USEDMEMORY=$(free -mt|tail -n 1|awk '{print$3F}')
TOTALMEMORY=$(free -mt|tail -n 1|awk '{print$2F}')
FREEMEMORY=$(free -mt|tail -n 1|awk '{print$4F}')
THRESHOLDMEMORY=100
date=$(date +%F-%H-%M-%S)
MESSAGE=""

if [ $USEDMEMORY -ge $THRESHOLDMEMORY ]
then
    echo "used memory crossed threshold where USEDMEMORY= $USEDMEMORY,THRESHOLDMEM=$THRESHOLDMEMORY and free memory=$FREEMEMORY"
    MESSAGE="used memory crossed threshold where USEDMEMORY= $USEDMEMORY,THRESHOLDMEM=$THRESHOLDMEMORY and free memory=$FREEMEMORY"
else
    echo "used memory=$USEDMEMORY,totalmemory=$TOTALMEMORY and left with freememory of $FREEMEMORY"
    MESSAGE="used memory=$USEDMEMORY,totalmemory=$TOTALMEMORY and left with freememory of $FREEMEMORY"
fi

echo "As per DATE=$date,$MESSAGE" | mail -s "memory usage in servers" cprathyusha94@gmail.com

