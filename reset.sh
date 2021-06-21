#!/bin/bash

git reset --hard
docker-compose down
sudo rm -rf ./certs
sudo rm -rf ./node-red/certs/ca.pem
sudo rm -rf ./node-red/node_modules
