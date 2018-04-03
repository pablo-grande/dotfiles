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
wget https://github.com/powerline/fonts/raw/master/UbuntuMono/Ubuntu%20Mono%20derivative%20Powerline.ttf
font_dir=/usr/local/share/fonts/UbuntuMono/
mkdir $font_dir
cp *.ttf $font_dir
rm *.ttf
fc-cache -f -v

exit

