#!/bin/sh

if [ -f /etc/debian_version ]; then
    apt-get update -qq && apt-get install -y python --no-install-recommends -qq
    exit 0
fi

if [ -f /etc/alpine-release ]; then
    apk update && apk add curl python
    exit 0
fi
