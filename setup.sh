#!/bin/bash

set -eu

mkdir -p ./logs ./tmp

if [ ! -f ./context/data ]; then
    echo Create some build context...may take a minute
    dd if=/dev/urandom of=./context/data bs=10M count=40
fi

sudo service docker stop || echo "Docker not running..."

TMPDIR=./tmp sudo docker -d 2>&1 | tee ./logs/dockerd.log

