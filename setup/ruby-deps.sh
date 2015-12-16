#!/usr/bin/env bash

echo 'nameserver 8.8.4.4
nameserver 223.5.5.5' >  /etc/resolv.conf 


# ubuntu one install ruby 1.8, screws up the whole setup.
gem install bundler

#在 Ubuntu 12.04 Server 上安装部署 Ruby on Rails 应用
#https://ruby-china.org/wiki/install-rails-on-ubuntu-14-04-server
