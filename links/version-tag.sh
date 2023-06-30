#!/usr/bin/env bash

curl -H "Cache-Control: no-cache" -sL "https://raw.githubusercontent.com/alpine-docker/multi-arch-libs/stable/functions.sh" -o functions.sh
source functions.sh

image="alpine/links"

# 2.29
version=$(docker run -ti --rm ${image} -version |awk '/Links/{print $2}'|sed 's/\r//g')
echo $version

install_crane
./crane copy ${image} ${image}:${version}
