#!/bin/bash

. .venv/bin/activate

for i in {1..3}; do
    echo "starting $i"
    TMPDIR=./tmp python bench.py $i &
done
