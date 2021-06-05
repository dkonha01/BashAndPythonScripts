#!/bin/bash

# Find largest directories

sudo du -a / 2>/dev/null | sort -n -r | head -n 20
