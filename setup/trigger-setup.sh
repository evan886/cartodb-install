#!/usr/bin/env bash

cd /usr/local/src

git clone https://github.com/CartoDB/pg_schema_triggers.git
#sudo hg clone https://bitbucket.org/malloclabs/pg_schema_triggers
cd pg_schema_triggers
sudo make -j2  && sudo make install

# update postgresql.conf
echo "shared_preload_libraries = 'schema_triggers.so'" | sudo tee -a /etc/postgresql/9.3/main/postgresql.conf
sudo service postgresql restart
