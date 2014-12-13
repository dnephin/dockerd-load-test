#!/usr/bin/env python

from subprocess import *
import logging
import sys
import time


log = logging.getLogger()


def build_and_run(index):
    stdout = open('./logs/build-%s.stdout' % index, 'w')
    stderr = open('./logs/build-%s.stderr' % index, 'w')
    print "starting build %s" % index
    return Popen("docker build -t testing_%s context" % index,
          shell=True,
          stdout=stdout,
          stderr=stderr)


def build_many(count):
    procs = map(build_and_run, range(count))
    print "Building %s concurrently" % count
    print "See logs in ./logs"
    while any(proc.poll() is None for proc in procs):
        time.sleep(0.2)


def run(num_of_procs):
    call("docker --version", shell=True)
    call("docker info", shell=True)

    call("touch context/data", shell=True)

    start = time.time()
    build_many(num_of_procs)
    elapsed = time.time() - start
    print "Elapsed time: %0.3f" % elapsed
    log.info("build %s: elapsed %0.3f" % (num_of_procs, elapsed))


def get_num_of_procs():
    return 10 if len(sys.argv) < 2 else int(sys.argv[1])


if __name__ == "__main__":
    logging.basicConfig(level=logging.DEBUG)
    run(get_num_of_procs())
