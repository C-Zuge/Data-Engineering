#!/bin/bash

# Build the base images from which are based the Dockerfiles
# then Startup all the containers at once deatached
docker-compose up -d --build --force-recreate