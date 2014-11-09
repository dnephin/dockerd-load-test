#!/bin/bash

set -e

docker ps -a | grep testing_ | awk '{ print $1 }' | xargs -r docker rm
