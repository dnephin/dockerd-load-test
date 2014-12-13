#!/bin/bash

set -eu

docker ps -a | grep testing_ | awk '{ print $1 }' | xargs -r docker rm
docker images | grep testing_ | awk '{ print $3 }' | xargs -r docker rmi

rm -rf ./tmp/* ./context/data
