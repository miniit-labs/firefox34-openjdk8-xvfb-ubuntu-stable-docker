#!/bin/sh

IMAGE=miniitlabs/firefox34-openjdk8-xvfb

docker build --force-rm --no-cache --compress -t $IMAGE:latest -f Dockerfile .

if [ $? -ne 0 ];
then
    exit $?
fi

docker login

if [ $? -ne 0 ];
then
    exit $?
fi

docker push $IMAGE

