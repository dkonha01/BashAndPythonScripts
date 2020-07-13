
#!/bin/bash

ADMIN="dkonhauser@gmail.com"
# set alert level 90% is default
ALERT=60
df -H | grep -vE '^Filesystem|tmpfs|map' | awk '{ print $5 " " $1 }' | while read output;
do
  echo $output
  usep=$(echo $output | awk '{ print $1}' | cut -d'%' -f1  )
  partition=$(echo $output | awk '{ print $2 }' )
  if [ $usep -ge $ALERT ]; then
    echo -e  "Running out of space \"$partition ($usep%)\" on $(hostname) as on $(date)" |
     sendmail $ADMIN
  fi
done


