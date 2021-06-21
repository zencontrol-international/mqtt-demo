#!/bin/bash

FILE=./certs/cert.pem
HOST_IP=`getent hosts host.docker.internal | awk '{ print $1 }'`

if [ -f $FILE ]; then
   echo "Using existing certificate"
else
  docker run -it --entrypoint=/bin/bash -v ${PWD}/node-red:/node-red node -c 'cd /node-red && npm install'
  docker run -it -v ${PWD}/node-red/:/node-red hairyhenderson/sed -i -e 's/host.docker.internal/'${HOST_IP}'/g' /node-red/flows.json
  docker run -v ${PWD}/tls/generate-certs:/usr/local/bin/generate-certs -v ${PWD}/certs:/certs -e SSL_SIZE=4096 -e SSL_IP=${HOST_IP} paulczar/omgwtfssl
  cp ./certs/ca.pem ./node-red/certs/ca.pem
fi

# Launches everything in the docker file, then logs it in a way that lets you Ctrl-C out of the logs
# without taking the containers back down.
docker-compose pull --ignore-pull-failures && docker-compose up -d
