#!/bin/sh

echo "List of docker images on Bluemix..."
echo ""
echo "Log into Bluemix..."
cf login -u ccc@zurich.ibm.com
echo ""
echo "Log into IBM Containers on Bluemix..."
cf ic login
export DOCKER_HOST=tcp://containers-api.stage1.ng.bluemix.net:8443
export DOCKER_CERT_PATH=/Users/cclauss/.ice/certs
export DOCKER_TLS_VERIFY=1
echo ""
echo "docker images..."
docker images  # returns: "json: cannot unmarshal string into Go value of type int"
echo "docker ps..."
docker ps  # hangs and never returns
