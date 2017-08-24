#!/usr/bin/env bash
set -e

export GRAILS_VERSION=$1
if [ -z $GRAILS_VERSION ]; then
   echo 1>&2 "Usage: ./build_image.sh <GRAILS_VERSION>"
   exit 1;
fi
docker build --build-arg GRAILS_VERSION=$GRAILS_VERSION -t mirasrael/grails:$GRAILS_VERSION .
docker build -f - -t mirasrael/grails:${GRAILS_VERSION}-npm . <<< $( echo FROM mirasrael/grails:$GRAILS_VERSION; echo RUN apt-get install -y npm )
docker push mirasrael/grails:$GRAILS_VERSION
docker push mirasrael/grails:${GRAILS_VERSION}-npm

