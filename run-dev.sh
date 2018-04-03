#!/bin/bash

set -xe

apt-get install -y mysql-client 
mysql -u root -pdevelop -h db -e "CREATE DATABASE IF NOT EXISTS test;"
mysql -u root -pdevelop -h db -e "CREATE USER IF NOT EXISTS test IDENTIFIED BY 'test';"
mysql -u root -pdevelop -h db -e "GRANT ALL PRIVILEGES ON test.* TO 'test';"
mysql -u root -pdevelop -h db -e "FLUSH PRIVILEGES;"


RAILS_ENV=development rake db:schema:load
RAILS_ENV=development rake db:seed
RAILS_ENV=development rails server -p 3000 -b '0.0.0.0' 

