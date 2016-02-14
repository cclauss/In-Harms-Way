#!/bin/sh

IMAGE_NAME="ataltitude_web"
echo "Build, tag, and push ${IMAGE_NAME} image to Bluemix..."
echo ""
echo "Log into Bluemix..."
cf login -u ccc@zurich.ibm.com
echo "Log into IBM Containers on Bluemix..."
cf ic login
export DOCKER_HOST=tcp://containers-api.stage1.ng.bluemix.net:8443
export DOCKER_CERT_PATH=/Users/cclauss/.ice/certs
export DOCKER_TLS_VERIFY=1
echo ""
echo "Build and tag ${IMAGE_NAME} image for Bluemix..."
docker build -t $IMAGE_NAME .
docker tag $IMAGE_NAME registry.stage1.ng.bluemix.net/cclauss/${IMAGE_NAME}:latest
docker images | grep ${IMAGE_NAME}:latest
echo ""
echo "Push ${IMAGE_NAME} image to Bluemix..."
docker push registry.stage1.ng.bluemix.net/cclauss/${IMAGE_NAME}:latest
echo ""
echo "docker images..."
docker images
echo "docker ps..."
docker ps
exit


echo "pre: docker-compose up -d"
docker-compose up -d
sleep 4
echo "post: docker-compose up -d"
echo ""
docker ps
# echo ""
# boot2docker ip
