#!/bin/bash 

if [ $(id -u) -ne 0 ]; then
	echo "ERROR: Non sudo user"
	exit
fi

# move all dotfiles into HOME
cp .bash* $HOME
cp -r .vim $HOME

# run install on requirements.txt (with pip if needed)
apt update -y
apt install -y `cat requirements.txt`

# put git files at home/
cp .gitconfig $HOME
cp .gitignore_global $HOME

# put all new files as $USER owner:group
chown -R $USER:$USER $HOME/.vim/ $HOME/.bash* $HOME/.git*

# check if Projects and PROJECT_HOME already exists
if [ -z "${PROJECT_HOME}" ]; then 
	mkdir $HOME/Projects
	export PROJECT_HOME=$HOME/Projects
	chown -R $USER:$USER $HOME/Projects/
fi

source $HOME/.bashrc
source $HOME/.bash_aliases


# =====
#  VIM 
# =====

echo Installing Vundle
git clone https://github.com/VundleVim/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim

echo Installing Powerline fonts
curl -LOk https://github.com/powerline/fonts/archive/master.zip
unzip master.zip
cp -r fonts-master/UbuntuMono/ /usr/local/share/fonts/
fc-cache -fv
rm -rf fonts-master/ master.zip

exit

