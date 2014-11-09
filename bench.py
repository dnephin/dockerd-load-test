

import docker
import logging
import sys


timeout = 3

def do_build(index):
    image_tag = 'testing_%s' % index
    print "make client"
    client = docker.Client(timeout=timeout, version="1.13")

    #print "pull"
    #for line in client.pull('busbox:latest', stream=True):
    #    print line

    try:
        print "build"
        for line in client.build('.', tag=image_tag, stream=True, rm=True):
            print line
    except Exception as e:
        print e

    print "up"
    container = client.create_container(image=image_tag)
    print container
    client.start(container['Id'])
    print "done"


if __name__ == "__main__":
    logging.basicConfig(level=logging.DEBUG)
    do_build(sys.argv[1])
