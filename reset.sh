#!/bin/bash

git reset --yes --hard
docker-compose down
sudo rm -rf ./certs

