#!/bin/bash
. $(dirname $(readlink -f $0))/config
CONTAINERNAME=mockbuild:latest
CACHEPATH=/var/cache/docker-builder/mock
DIST_VERSION=`echo $DIST | sed 's|centos||'`
[ -z "${DIST_VERSION}" ] && DIST_VERSION=7
docker run ${DNSPARAM} --privileged --rm -v ${CACHEPATH}/cache:/var/cache/mock -v ${CACHEPATH}/lib:/var/lib/mock ${CONTAINERNAME} \
    bash -c "su - abuild -c 'mock -r centos-${DIST_VERSION}-x86_64 -v --update'"
