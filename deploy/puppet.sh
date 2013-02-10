#!/bin/sh
DIR=`dirname $0`
CONTENT=$(cat deploy/hosts)
source $DIR/vars
fab -H $HOSTS -f $DIR/fabfile.py puppet clean
exit $?
