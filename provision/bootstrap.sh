#!/bin/sh

############################
#
# Bitcoin DEV
#
#  Base Bootstrap
#
#  Ubuntu 16.04
#  https://www.ubuntu.com/
#
#  Packages:
#   vim tmux screen
#
#  author: kchevalier@protonmail.com
#  date: April, 2018
#
############################


#################
#
# System Updates
#
#################

# get list of updates
apt-get update

# update all software
apt-get upgrade -y


################
#
# Install Tools
#
################

apt-get install vim tmux screen -y


####################################
#
# Install Bitcoin Core Dependencies
#
####################################

# required dependencies
apt-get install build-essential libtool autotools-dev automake pkg-config libssl-dev libevent-dev bsdmainutils python3 -y

# [optional] libboost
apt-get install libboost-system-dev libboost-filesystem-dev libboost-chrono-dev libboost-program-options-dev libboost-test-dev libboost-thread-dev -y

# [optional] libdb4.8
apt-get install software-properties-common -y
add-apt-repository ppa:bitcoin/bitcoin -y
apt-get update
apt-get install libdb4.8-dev libdb4.8++-dev -y

# [optional] libminiupnpc
apt-get install libminiupnpc-dev -y

# [optional] libzmq3
apt-get install libzmq3-dev -y


##################################
#
# Install Libbitcoin Dependencies
#
##################################

apt-get install libboost-all-dev -y

# build libzmq 4.2+ (no package available)
wget https://github.com/zeromq/libzmq/releases/download/v4.2.3/zeromq-4.2.3.tar.gz
tar -xzvf zeromq-4.2.3.tar.gz
cd zeromq-4.2.3/
./configure
make install
ldconfig


######################################
#
# Install Pybitcointools Dependencies
#
######################################

apt-get install python-pip python-dev build-essential -y
pip install --upgrade pip
pip install --upgrade virtualenv



###############
#
# VIM Settings
#
###############

su ubuntu <<EOSU
echo 'syntax enable
set hidden
set history=100
set number
filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab' > ~/.vimrc
EOSU

