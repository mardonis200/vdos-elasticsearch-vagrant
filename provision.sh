#!/bin/bash

wget -qO - https://packages.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -
echo "deb https://packages.elastic.co/elasticsearch/2.x/debian stable main" | sudo tee -a /etc/apt/sources.list.d/elasticsearch-2.x.list
echo "deb https://packages.elastic.co/logstash/2.4/debian stable main" | sudo tee -a /etc/apt/sources.list
echo "deb https://packages.elastic.co/kibana/4.6/debian stable main" | sudo tee -a /etc/apt/sources.list.d/kibana.list

apt-get -y update

apt-get -y install elasticsearch logstash kibana openjdk-7-jre

service elasticsearch start
service kibana start

ln -s /vagrant/vdos.conf /etc/logstash/conf.d/vdos.conf

cp /vagrant/attacks.txt /var/log/attacks.txt

service logstash restart