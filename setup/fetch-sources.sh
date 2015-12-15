#!/usr/bin/env bash

cd /usr/local/src

#自己先fetch to laptop 
git clone --recursive https://github.com/CartoDB/cartodb.git
git clone https://github.com/CartoDB/CartoDB-SQL-API.git
git clone https://github.com/CartoDB/Windshaft-cartodb.git
