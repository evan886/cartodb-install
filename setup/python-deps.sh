#!/usr/bin/env bash

# is change 

cd /usr/local/src/cartodb
#so long
easy_install pip


#easy_install pip 报错 请用下面的安装和本地安装方法

#wget https://pypi.python.org/packages/source/p/pip/pip-7.1.2.tar.gz
#tar xvf pip-7.1.2.tar.gz 
#cd pip-7.1.2/
#sudo python setup.py install

#some time  Read timed out  
 
# mark timed outto use 

#pip install -r python_requirements.txt    --no-cache-dir 
pip install -r python_requirements.txt  #如果报错用上面的命令

#   x86_64-linux-gnu-gcc: error trying to exec 'cc1plus': execvp: No such file or directory
#   error: command 'x86_64-linux-gnu-gcc' failed with exit status 1
 
#  ----------------------------------------
#Rolling back uninstall of GDAL
#Command "/usr/bin/python -c "import setuptools, tokenize;__file__='/tmp/pip-build-5IbI1r/gdal/setup.py';exec(compile(getattr(tokenize, 'open', open)(__file__).read().replace('\r\n', '\n'), __file__, 'exec'))" install --record /tmp/pip-3aKDsR-record/install-record.txt --single-version-externally-managed --compile" failed with error code 1 in /tmp/pip-build-5IbI1r/gdal


pip install -e git+https://github.com/RealGeeks/python-varnish.git@0971d6024fbb2614350853a5e0f8736ba3fb1f0d#egg=python-varnish

# 如果上面的命令出错 就用下面这两行命令 记得要去掉#
# git clone https://github.com/RealGeeks/python-varnish.git
# python-varnishcd 
# python  setup.py install
