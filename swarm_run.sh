#!/usr/bin/env bash

cd tomcatsample
./build_tomcat.sh
docker build -t tomcat_sample .
cd ..

cd mongosample
docker build -t mongo_sample .
cd ..


docker swarm init
docker deploy --compose-file swarm-compose.yml tomcat_mongo_docker