#!/bin/sh

docker container stop 1c-server
docker container rm 1c-server
docker run --name 1c-server \
  --net host \
  --detach \
  --volume home:/home/usr1cv8 \
  --volume logs:/var/log/1C \
  its.local/1c-server:8.3.16-1148
