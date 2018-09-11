#!/bin/bash

if [ $(id -u) -ne 0 ]; then
	echo "ERROR: Non sudo user"
	exit
fi


echo Downloading Docker data
apt-get -y install \
	apt-transport-https \
	ca-certificates \
	software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -


echo Verifying Docker fingerprint
apt-key fingerprint 0EBFCD88


add-apt-repository \
	"deb [arch=amd64] https://download.docker.com/linux/ubuntu \
	$(lsb_release -cs) \
	stable"


echo Installing Docker
apt-get -y update
apt-get -y install docker-ce


echo Giving permissions to $USER
usermod -aG docker $USER
echo "WARNING: Log Out (or even reboot) in order to use Docker as $USER"

exit

