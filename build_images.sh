#!/usr/bin/env bash
export GRAILS_VERSION=3.2.8
docker build -t mirasrael/grails:$GRAILS_VERSION .
(cd npm; docker build -t mirasrael/grails:${GRAILS_VERSION}-npm .)
docker push mirasrael/grails:$GRAILS_VERSION
docker push mirasrael/grails:${GRAILS_VERSION}-npm

