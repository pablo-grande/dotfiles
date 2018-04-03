echo Installing pip3
apt-get -y install python3-pip

pip3 install virtualenv
pip3 install virtualenvwrapper

echo Installing virtualenv
bashrc=$HOME/.bashrc
echo "\n" >> $bashrc
echo export WORKON_HOME=$HOME/.virtualenvs >> $bashrc
echo export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3 >> $bashrc
echo source ~/.local/bin/virtualenvwrapper.sh >> $bashrc
export $bashrc

exit
