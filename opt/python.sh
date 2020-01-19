#!/bin/bash

if [ $(id -u) -ne 0 ]; then
	echo "ERROR: Non sudo user"
	exit
fi

echo Installing python packages
apt-get -y install python3 python3-pip ipython

pip3 install virtualenv
pip3 install virtualenvwrapper

echo Aliasing python3
HOME=/home/$SUDO_USER
readonly bash_aliases=$HOME/.bash_aliases
echo alias python=\"python3\" >> $bash_aliases
echo alias pip=\"pip3\" >> $bash_aliases

echo Installing virtualenv
readonly bashrc=$HOME/.bashrc
# delete comment preventing virtualenvwrapper from being sourced
sed -i '/virtualenvwrapper.sh/s/# //g' $bashrc
. $bashrc

