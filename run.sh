#!/usr/bin/env bash

./clean_docker.sh

cd tomcatSample
./build_tomcat.sh

cd ..


cp ca_cert.pem tomcatSample
cp ca_cert.pem mongoSample

cp tomcat_cert.pem tomcatSample
cp tomcat_key.pem tomcatSample
cp tomcat.p12 tomcatSample
cp mongo.pem mongoSample

docker-compose up

