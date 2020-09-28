#!/bin/bash

for i in *.mp3
do
     brate=$(mediainfo "$i" | grep "Bit rate     "  | awk '{print $4}')
     if [  "$brate" -gt 160 ] && ! [ -f Selects/"i" ]; then
         cp "$i" Selects

         #  echo "$i:$brate" 
     fi
done
