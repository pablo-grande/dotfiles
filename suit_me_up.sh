#!/bin/bash

if [ $(id -u) -ne 0 ]; then
	echo "ERROR: Non sudo user"
	exit
fi

# move all dotfiles into HOME
cp .bash* $HOME
cp -r .vim $HOME

# run install on requirements.txt
apt update -y
apt install -y `cat requirements.txt`

# put git files at home/
cp .gitconfig $HOME
cp .gitignore_global $HOME

# check if Projects and PROJECT_HOME already exists
if [ -z "${PROJECT_HOME}" ]; then
	mkdir $HOME/Projects
	echo PROJECT_HOME=$HOME/Projects >> $HOME/.bashrc
	chown -R $SUDO_USER:$SUDO_USER $HOME/Projects/
fi

source $HOME/.bashrc
source $HOME/.bash_aliases

echo Installing Vundle
git clone https://github.com/VundleVim/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim

readonly fonts_dir=/usr/local/share/fonts/
if [ -d $fonts_dir ]; then
	echo Installing Powerline fonts
	curl -LOk https://github.com/powerline/fonts/archive/master.zip
	unzip master.zip
	cp -r fonts-master/UbuntuMono/ $fonts_dir
	fc-cache -fv
	rm -rf fonts-master/ master.zip
fi

echo "Setting i3"
cp -r i3* $HOME/.config

# put all new files as $SUDO_USER owner:group
chown -R $SUDO_USER:$SUDO_USER $HOME/.vim/ $HOME/.bash* $HOME/.git* $HOME/.config/i3*


