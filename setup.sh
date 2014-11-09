#!/bin/bash

set -e


if [[ ! -d .venv ]]; then
    virtualenv .venv
    .venv/bin/pip install -r requirements.txt
fi

mkdir -p ./tmp

sudo service docker stop || echo "Docker not running..."

TMPDIR=./tmp sudo docker -d 2>&1 | tee dockerd.log
