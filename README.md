# cartodb-install
install  and  setting up  cartodb on a linux（Ubuntu 14.04.03  LTS） server

其实就是安装和运行了 ruby1.9.1, postgres ,redis-server 等 
如果你是个初学者 请看最下面的 因为我测试过 有时自动运行会报错或者出现交互界面 因为是帮一下朋友而突然整的 所以还不是很完善 有问题可以直接找我 evan886@gmail.com or www.linuxchina.net


#ps CartoDB是基于Ruby开发的 网上很多教程都说基于 Ubuntu 12.04  但是其实12.04 虽然是LTS 但是三年支持已过 ，所以用Ubuntu 14.04。03  LTS

#感谢下面的这些作者
参考
http://cartodb.readthedocs.org/en/latest/operations/changing_limits.html
https://gist.github.com/ohvitorino/9638870
https://github.com/mtwestra/cartodb-linux
https://gist.github.com/arjendk/6080388
https://github.com/plablo09/cartodb-install

#ps 这个教程也是特别不错哦 
#http://blog.csdn.net/u013010356/article/details/17073017


#这个是基于RHEL
https://github.com/lordlinus/cartodb/blob/master/RedHat%206.5

Server:

1. Configure a vps or vm  with linux （Ubuntu 14.04  LTS Bare OS）

2. Copy the content of https://github.com/evan886/cartodb-ins to the root directory

3. Run `install-cartodb.sh`

4. Halfway, the install script stalls at the postgres prompt. To get out, type 'exit' followed by enter

5. At the end of the install script, the system parts are started.

Browser:

1. The settings use user=evan and subdomain=evan. This means that the server expects to run from `http://evan.localhost.lan:3000/`. To accomplish this, add an entry to /etc/hosts to forward this address to your vm or VPS, for example: 

`xx.xxx.xx.xxx evan.localhost.lan`

2. Go to `http://evan.localhost.lan:3000/dashboard` in the browser(chrome or firefox ), and use the username (evan) and password(123456) as set in the settings file . You should be able to login to the cartodb dashboard now.

### pgAdmin
You can use pgAdmin3 to connect to the guest, to see what is going on in the postgresql database. Settings:
```
name: whatever you like
host: localhost
port: 15432
Maintenance database: postgres
username: postgres
password: empty (no really, empty)




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



