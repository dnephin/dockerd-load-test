#!/bin/bash

set -e

docker ps -a | grep testing_ | awk '{ print $1 }' | xargs -r docker rm

sudo rm -rf /tmp/docker-build*
sudo rm -rf ./tmp/*
