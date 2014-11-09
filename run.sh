#!/bin/bash

. .venv/bin/activate

for i in {1..10}; do
    echo "starting $i"
    TMPDIR=./tmp python bench.py $i &
done

