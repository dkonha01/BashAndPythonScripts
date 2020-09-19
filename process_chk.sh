#!/bin/sh

pattern=$1

ps -e | grep -v $$ | grep $pattern | awk '{print $4}'
