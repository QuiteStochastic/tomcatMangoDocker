#!/usr/bin/env bash

cd tomcatSample
./build_tomcat.sh
docker build -t tomcat_sample .
cd ..

cd mongoSample
docker build -t mongo_sample .
cd ..


docker swarm init
docker deploy --compose-file swarm_compose.yml tomcat_mongo_docker