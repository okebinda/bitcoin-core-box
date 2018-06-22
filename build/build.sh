#!/bin/sh

cd /vagrant/application

# build bitcoin core
git clone https://github.com/bitcoin/bitcoin.git
cd bitcoin/
git checkout v0.16.0
./autogen.sh
./configure --with-gui=no
make
sudo make install

# build libbitcoin
mkdir /vagrant/application/libbitcoin
cd /vagrant/application/libbitcoin
wget https://raw.githubusercontent.com/libbitcoin/libbitcoin/version3/install.sh
chmod +x install.sh
sudo ./install.sh

# build libbitcoin-explorer
mkdir /vagrant/application/libbitcoin-explorer
cd /vagrant/application/libbitcoin-explorer
wget https://raw.githubusercontent.com/libbitcoin/libbitcoin-explorer/version3/install.sh
chmod +x install.sh
sudo ./install.sh

# install python bitcoin tools
sudo pip install pybitcointools
sudo pip install ecdsa
