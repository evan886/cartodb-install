#!/usr/bin/env bash

#is ok on ubuntu 14.04    
# This takes care of installing dependencies required from debian repos.

export LANGUAGE="en_US.UTF-8"
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

echo 'nameserver 8.8.4.4
nameserver 223.5.5.5' >  /etc/resolv.conf 

apt-get update

apt-get install -y python-software-properties

# new
#apt-get install nodejs
#sudo add-apt-repository ppa:cartodb/nodejs-010
#sudo apt-get update; sudo apt-get upgrade
#sudo apt-get dist-upgrade
# end new
#软件源的设置
echo "================= getting repositories =================="
add-apt-repository -y ppa:cartodb/base
add-apt-repository -y ppa:cartodb/gis
add-apt-repository -y ppa:cartodb/mapnik  #mapnik/v2.1.0
add-apt-repository -y ppa:cartodb/nodejs #nodejs-010
add-apt-repository -y ppa:cartodb/redis  #here
add-apt-repository -y ppa:cartodb/postgresql #postgresql-9.3
sudo add-apt-repository -y   ppa:cartodb/varnish  # 这些只有  precise
#add-apt-repository -y ppa:ubuntugis/ubuntugis-unstable

echo "================= apt-get update =================="
apt-get update  #软件列表更新

echo "================= apt-get install ==================" 
# 安装相关的依赖软件包
#apt-get install -y  libgeos-c1      libgeos-c1v5  libspatialite5  libgdal1h
apt-get install -y    libspatialite5  unp zip unzip   
apt-get install -y      libgdal1h


#here now  14.04 is 9.3   这些命令有时要测试多次 

#After this operation, 123 MB of additional disk space will be used.
#WARNING: The following packages cannot be authenticated!
#  python-gdal
#E: There are problems and -y was used without --force-yes


apt-get install -y make unp zip libgeos-c1 libgeos-dev gdal-bin libgdal1-dev libjson0 \
  python-simplejson libjson0-dev proj-bin proj-data libproj-dev postgresql \
  postgresql-client-9.3 postgresql-contrib-9.3 postgresql-server-dev-9.3 \
  postgresql-plpython-9.3 ruby1.9.1 ruby1.9.1-dev nodejs redis-server libmapnik-dev \
  mapnik-utils python-mapnik git python-setuptools python-gdal gdal-bin libgdal1-dev \
  mercurial

