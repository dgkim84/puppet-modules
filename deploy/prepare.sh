#!/bin/sh
DIR=`dirname $0`
CONTENT=$(cat deploy/hosts)
i=0
HOSTS=""
for HOST in $CONTENT; do
  if [ $i -gt 0 ]; then
    HOSTS=$HOST,$HOSTS
  else
    HOSTS=$HOST
  fi
  i=$(expr $i + 1)
done
fab -H $HOSTS -f $DIR/fabfile.py prepare clean
exit $?
