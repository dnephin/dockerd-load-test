#!/bin/bash

set -eu

docker ps -a | grep testing_ | awk '{ print $1 }' | xargs -r docker rm

# TODO: /tmp/docker-build still used?
sudo rm -rf /tmp/docker-build* ./tmp/* ./context/data

sudo service docker start
