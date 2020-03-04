#!/bin/sh

#docker image rm its.local/1c-server -f
sudo docker build --tag itsbz/1c-server:8.3.16-1148 .
sudo docker push itsbz/1c-server
