#!/usr/bin/env bash

##java
sudo apt-get install default-jdk

##maven

sudo apt-get install maven


##latest docker on ubuntu

sudo apt-get install apt-transport-https ca-certificates

curl -fsSL https://yum.dockerproject.org/gpg | sudo apt-key add -

apt-key fingerprint 58118E89F3A912897C070ADBF76221572C52609D

sudo add-apt-repository "deb https://apt.dockerproject.org/repo/ubuntu-$(lsb_release -cs)main"

sudo apt-get update

sudo apt-get -y install docker-engine


##now restart shell

## to turn on experimental mode in ubuntu, not sure this works:
#sudo vim /etc/default/docker
##add the line:
#DOCKER_OPTS="--experimental"
#sudo vim /lib/systemd/system/docker.service
##add the line under [Service]
#EnvironmentFile=-/etc/default/docker