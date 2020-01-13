#!/bin/bash

if [[ $1 == '--restore' || $1 == '-r' ]];then
	cp .bash* $HOME
	cp .vim/vimrc $HOME/.vim/
	cp .vim/snippets.py $HOME/.vim/
	cp .git* $HOME
	cp -r i3* $HOME/.config/
else
	cp $HOME/.bash_aliases .
	cp $HOME/.bashrc .
	cp $HOME/.vim/vimrc .vim/
	cp $HOME/.vim/snippets.py .vim/
	cp $HOME/.gitconfig .
	cp $HOME/.gitignore_global .
	cp -r $HOME/.config/i3* .
fi
