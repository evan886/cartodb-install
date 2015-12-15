#!/usr/bin/env bash

#is ok on ubuntu 15.04    
# This takes care of installing dependencies required from debian repos.

export LANGUAGE="en_US.UTF-8"
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

apt-get update

apt-get install -y python-software-properties

# new
#apt-get install nodejs
#sudo add-apt-repository ppa:cartodb/nodejs-010
#sudo apt-get update; sudo apt-get upgrade
#sudo apt-get dist-upgrade
# end new

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
apt-get update

echo "================= apt-get install ==================" #gdal-bin
# on 12.04 cat be err 
#apt-get install -y  libgeos-c1      libgeos-c1v5  libspatialite5  libgdal1h
apt-get install -y    libspatialite5  unp zip unzip   
apt-get install -y      libgdal1h


#here now  14.04 is 9.3   有时要测试多次 

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

