#!/usr/bin/env bash

#by evan  为时要多次并不用y才可以安装 怪了 
apt-get install node npm   -y 
apt-get install nodejs-legacy

#  npm --version
# node --version

#/etc/profile
# export PATH=$PATH:/usr/sbin/node

# http://stackoverflow.com/questions/12913141/message-failed-to-fetch-from-registry-while-trying-to-install-any-module

#sudo add-apt-repository -y ppa:cartodb/nodejs-010
#sudo apt-get install nodejs npm

#ip 100  http://www.twenty10studios.com/2015/02/18/npm-install-legacy-binary-node/
cd /usr/local/src/CartoDB-SQL-API
git checkout master
npm install

# fix  install nodejs-legacy 
# engine boom@2.10.1: wanted: {"node":">=0.10.40"} (current: {"node":"v0.10.25","npm":"1.3.10"})

mkdir logs

cd /usr/local/src/Windshaft-cartodb
git checkout master
npm install
mkdir logs



