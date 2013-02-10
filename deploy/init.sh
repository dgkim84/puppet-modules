#!/bin/sh
DIR=`dirname $0`
CONTENT=$(cat deploy/hosts)
source $DIR/vars

usage() {
  echo "./deploy/init.sh"
  echo "    dev   - development tools"
  echo "    tools - tools without dev"
}

case "$1" in
  "")
    usage
    ;;
  *)
    fab -H $HOSTS -f $DIR/fabfile.py $1
    ;;
esac
exit $?
