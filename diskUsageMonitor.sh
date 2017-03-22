
#!/bin/bash
# ----------------------------------------------------------------------
# Linux shell script to watch disk space (should work on other UNIX oses )
# SEE URL: http://www.cyberciti.biz/tips/shell-script-to-watch-the-disk-space.html
# set admin email so that you can get email
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


