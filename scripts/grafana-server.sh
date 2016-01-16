######################################################################
### Script cai dat Grafana 2.6.x
### CongTo tcvn1985@gmail.com
### 16/01/2016
######################################################################
#!/bin/bash

apt-get update 

echo "deb https://packagecloud.io/grafana/stable/debian/ wheezy main" >> /etc/apt/sources.list
curl https://packagecloud.io/gpg.key | sudo apt-key add -
sudo apt-get update
sudo apt-get -y install grafana

echo "Khoi dong Grafana"
sleep 5
sudo service grafana-server start

echo "Cho phep grafana khoi dong cung OS"
sleep 3
sudo update-rc.d grafana-server defaults 95 10

