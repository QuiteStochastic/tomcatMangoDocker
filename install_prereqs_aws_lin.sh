#!/usr/bin/env bash

##git lol
sudo yum install git -y

##java
sudo yum install java-1.8.0-openjdk-devel -y


#echo "export JAVA_HOME=\$(dirname \$(dirname \$(readlink -f \$(which java))))" | sudo tee --append /etc/profile
#echo "export PATH=\$JAVA_HOME/bin:\$PATH" | sudo tee --append /etc/profile
#export JAVA_HOME=$(dirname $(dirname $(readlink -f $(which java))))
#export PATH=$JAVA_HOME/bin:$PATH

echo "export JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk-1.8.0.121-0.b13.29.amzn1.x86_64" | sudo tee --append /etc/profile
echo "export PATH=\$JAVA_HOME/bin:\$PATH" | sudo tee --append /etc/profile


export JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk-1.8.0.121-0.b13.29.amzn1.x86_64
export PATH=$JAVA_HOME/bin:$PATH




##maven

sudo wget http://repos.fedorapeople.org/repos/dchen/apache-maven/epel-apache-maven.repo -O /etc/yum.repos.d/epel-apache-maven.repo
sudo sed -i s/\$releasever/6/g /etc/yum.repos.d/epel-apache-maven.repo
sudo yum install -y apache-maven
mvn --version



##latest docker on amazon linux
##do not do sudo yum install docker.  as of now, that doesn't give you the version 1.13 that you need.  when aws's repos advance though, then that would be sufficient
#sudo yum install docker -y

##do the below block once per new box
sudo curl -fsSLO https://get.docker.com/builds/Linux/x86_64/docker-1.13.1.tgz
sudo tar --strip-components=1 -xvzf docker-1.13.1.tgz -C /usr/local/bin
git clone https://github.com/tianon/cgroupfs-mount
sudo mv cgroupfs-mount/cgroupfs-mount /usr/local/bin/
sudo groupadd docker
sudo usermod -aG docker $USER

##do the below block every time the box restarts
sudo su
export PATH=/usr/local/bin:$PATH
cgroupfs-mount
##turn on experimental mode
dockerd --experimental &
