#!/bin/sh

eval "$(boot2docker shellinit)"
echo ""
docker-compose up -d
sleep 4
echo ""
docker ps
echo ""
boot2docker ip
