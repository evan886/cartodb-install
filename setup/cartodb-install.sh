#!/usr/bin/env bash

#root@ubuntu14:~# cat  /etc/resolv.conf 
#nameserver 8.8.4.4
#nameserver 223.5.5.5


source settings
echo "=========================== installing cartodb ========================="
gem install i18n -v '0.7.0'
gem install dropbox-sdk -v '1.6.3'
gem install sinatra -v '1.4.6'
gem install actionmailer -v '3.2.22'
cd /usr/local/src/cartodb
bundle install
#Don't run Bundler as root. Bundler can ask for sudo if it is needed, and installing your
#bundle as root will break this application for all non-root users on this machine.
#Rubygems 1.8.23 is not threadsafe, so your gems will be installed one at a time. Upgrade to #Rubygems 2.1.0 or higher to enable parallel gem installation.

cp config/app_config.yml /root/
cp config/database.yml /root/
mv config/app_config.yml.sample config/app_config.yml
mv config/database.yml.sample config/database.yml
