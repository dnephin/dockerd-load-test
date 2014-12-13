

docker build load test
======================

A script to reproduce an issue with docker build and many concurrent
build requests.

To reproduce:

    # stop dockerd and restart it with stdout logging
    ./setup.sh

    # run the test
    ./run.py [num concurrent build]

    # cleanup and restore docker service
    ./cleanup


Observation
-----------

Below are the results of running x concurrent builds


    Docker version 1.3.3, build d344625
    Kernel Version: 3.13.0-35-generic
    CPUs: 8

    build 1: elapsed 8.411
    build 2: elapsed 19.825
    build 3: elapsed 30.438
    build 4: elapsed 41.650
    build 5: elapsed 54.865
    build 10: elapsed 115.551
    build 20: elapsed 321.406

With latest

    Docker version 1.4.0, build 4595d4f

    build 1: elapsed 8.410
    build 5: elapsed 50.860
    build 10: elapsed 113.535
