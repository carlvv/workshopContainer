#!/bin/zsh

docker pull docker.io/herrsorgenfrei/boothello
docker run --rm --name boothello -p 3000:8080 herrsorgenfrei/boothello
