#!/bin/bash
echo -n "Enter the source folder: "
read src
echo -n "Enter the destination folder: "
read dest
for i in "$src"/*.mp3
do
     brate=$(mediainfo "$i" | grep "Bit rate     "  | awk '{print $4}')
     if [  "$brate" -gt 160 ] && ! [ -f "$dest"/"i" ]; then
         cp "$i" "$dest" 
         #  echo "$i:$brate" 
     fi
done
