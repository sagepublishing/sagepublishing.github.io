#!/bin/bash

docker build -t sagepublishing-github-io .
docker run -v ${PWD}:/sagepublishing.github.io -p 4000:4000 -it sagepublishing-github-io

