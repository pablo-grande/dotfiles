echo Installing pip3
apt-get -y install python3-pip

pip3 install virtualenv
pip3 install virtualenvwrapper

echo Installing virtualenv
bashrc=$HOME/.bashrc
echo "\n# Virtualenv\n" >> $bashrc
echo WORKON_HOME=$HOME/.virtualenvs >> $bashrc
echo VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3 >> $bashrc
source ~/.local/bin/virtualenvwrapper.sh
export $bashrc

exit
