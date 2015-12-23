#!/usr/bin/env bash

# os is ubuntu 14.04.5 LTS	 不用12.04 是因为 12.04 在15年就停止支持了 

#可以找所以的source 先fetch下来
# Install CartoDB for a development environment.
# This script can be run from the Vagrantfile or manually. See the README.
sudo cp config/* /usr/local/etc
chmod u+x setup/*.sh

source settings
echo "---------------------------- starting deb-deps.sh -------------------------------"

sudo setup/deb-deps.sh
echo "---------------------------- starting postgres-setup.sh -------------------------------"
sudo setup/postgres-setup.sh 
echo "---------------------------- starting postgis-install.sh -------------------------------"
sudo setup/postgis-install.sh 
echo "---------------------------- starting postgis-setup.sh -------------------------------"
sudo setup/postgis-setup.sh
echo "---------------------------- starting pg_schema_triggers -------------------------------"
sudo setup/trigger-setup.sh 
echo "---------------------------- starting fetch-sources.sh -------------------------------"
sudo setup/fetch-sources.sh 
echo "---------------------------- starting cartodb postgres extension -------------------------------"
sudo setup/cartodb-extension.sh 
echo "---------------------------- starting python-deps.sh -------------------------------"
sudo setup/python-deps.sh 
echo "---------------------------- starting node-deps.sh -------------------------------"
sudo setup/node-deps.sh 
echo "---------------------------- starting ruby-deps.sh -------------------------------"
sudo setup/ruby-deps.sh 
echo "---------------------------- starting cartodb-install.sh -------------------------------"
sudo setup/cartodb-install.sh  
echo "---------------------------- starting cartodb-setup.sh -------------------------------"
sudo setup/cartodb-setup.sh  
echo "---------------------------- end of initial setup -------------------------------"

echo "---------------------------- Make sure redis is running -------------------------"
pgrep redis-server || redis-server &

echo "---------------------------- start Windshaft app -------------------------------"
cd /usr/local/src/Windshaft-cartodb
sudo nohup node app.js development &

echo "---------------------------- start SQL API --------------------------------------"
cd /usr/local/src/CartoDB-SQL-API
sudo nohup node app.js development &

cd /usr/local/src/cartodb
echo "---------------------------- start resque script -------------------------------"
bundle exec script/resque &

echo "---------------------------- start web server ----------------------------------"
bundle exec rails s -d -p 3000



#by evan 
执行过程 
第一 复制相关配置文件到对应目录
sudo cp config/* /usr/local/etc

第二 给脚本执行的权限
chmod u+x setup/*.sh

第三 执行相关的安装和配置脚本 
分别是 setup 目录上的
1.deb-deps.sh
2.postgres-setup.sh 
3.postgis-install.sh
4.postgis-setup.sh
5.trigger-setup.sh
6.fetch-sources.sh
7.cartodb-extension.sh 
8.python-deps.sh 
9.node-deps.sh 
10.ruby-deps.sh 
11.cartodb-install.sh
12.cartodb-setup.sh

第四 运行相关服务 

pgrep redis-server || redis-server &

echo "---------------------------- start Windshaft app -------------------------------"
cd /usr/local/src/Windshaft-cartodb
sudo nohup node app.js development &

echo "---------------------------- start SQL API --------------------------------------"
cd /usr/local/src/CartoDB-SQL-API
sudo nohup node app.js development &

cd /usr/local/src/cartodb
echo "---------------------------- start resque script -------------------------------"
bundle exec script/resque &

echo "---------------------------- start web server ----------------------------------"
bundle exec rails s -d -p 3000

详细请见install-cartodb.sh
for catherine

