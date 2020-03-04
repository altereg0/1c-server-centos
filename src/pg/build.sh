#!/bin/bash

docker image rm its.local/postgres -f
docker build --tag its.local/postgres .
