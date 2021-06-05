#!/bin/bash

# Find largest files %s - size - %p -filename

sudo find / -type f -printf "%s\t%p\n" 2>/dev/null | sort -n | tail -10
