#!/usr/bin/env bash

cd tomcatSample
./build_tomcat.sh

cd ..


cp ca_cert.pem tomcatSample
cp ca_cert.pem mongoSample

cp tomcat.p12 tomcatSample
cp mongo.pem mongoSample


docker-compose up

