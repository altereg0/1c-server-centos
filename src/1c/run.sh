#!/bin/sh

docker container stop 1c_srv
docker container rm 1c_srv
docker run --name 1c_srv \
  --detach \
  --hostname srv-1c.solar
  -p 1540-1541:1540-1541 \
  -p 1560-1591:1560-1591 \
  --volume home:/home/usr1cv8 \
  --volume logs:/var/log/1C \
  alter/1c_srv
