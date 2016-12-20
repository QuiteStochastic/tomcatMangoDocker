#!/usr/bin/env bash

cd tomcatSample
./build_tomcat.sh

cd ..

docker-compose up

