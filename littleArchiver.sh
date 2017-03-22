#!/bin/bash


# prompt and read $source and $destination directories
find . -name "*.mp3" -size -2500k -exec cp {}  /Users/danielkonhauser/Desktop/juke/sussOut \; 
