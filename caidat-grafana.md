# Các ghi chép về Grafana

***
## Cài đặt grafana 3.x
***
- Cài đặt grafana 3.x
```sh
wget http://mirror1.net.one.com/grafana/testing/debian/pool/jessie/main/g/grafana/grafana_3.0.0-beta11459429091_amd64.deb
sudo apt-get install -y adduser libfontconfig
sudo dpkg -i grafana_3.0.0-beta11459429091_amd64.deb
```

***
# 1. Cài đặt và cấu hình grafana
## 1. Cài đặt grafana

- Môi trường cài đặt
```sh

```

- Các lệnh cài đặt

```sh
echo "deb https://packagecloud.io/grafana/stable/debian/ wheezy main" >> /etc/apt/sources.list

curl https://packagecloud.io/gpg.key | sudo apt-key add -

sudo apt-get update
sudo apt-get -y install grafana
```

- Khởi động grafana

```sh
sudo service grafana-server start
```

- Khởi động cùng OS
```sh
sudo update-rc.d grafana-server defaults 95 10
```

# 2. Các cấu hình đối với Graylog
***

## 2.1. Cấu hình cho zabbix

```sh
Tham khảo: https://github.com/alexanderzobnin/grafana-zabbix
```

- Download plugin zabbix cho grafana tu link
```sh
https://github.com/alexanderzobnin/grafana-zabbix/releases/tag/v2.5.1 
hoặc
https://github.com/alexanderzobnin/grafana-zabbix
```

- Giải nén file 
```sh
apt-get install unzip
unzip grafana-zabbix-2.5.1.zip
```

- Copy thư mục zabbix vừa giải nén vào thư mục plugin của grafana
```sh
cp -r /root/grafana-zabbix-2.5.1/zabbix/  /usr/share/grafana/public/app/plugins/datasource/
```

- Sửa file `plugin.json` trong thư mục `/usr/share/grafana/public/app/plugins/datasource/zabbix` như sau (thêm 2 dòng username và password)

```sh
{
  "pluginType": "datasource",
  "name": "Zabbix",

  "type": "zabbix",
  "serviceName": "ZabbixAPIDatasource",

  "module": "app/plugins/datasource/zabbix/datasource",

  "partials": {
    "config": "app/plugins/datasource/zabbix/partials/config.html"
  },

  "username": "admin",
  "password": "DATA2o016ZaBB1x",

  "metrics": true,
  "annotations": true
}

```

- Khởi động lại grafana
```sh 
service grafana-server restart
```


#### Phía client 

##### Các bước add trên Zabbix


![plugincpu](/images/grafana-zabbix1.png)

![plugincpu](/images/grafana-zabbix2.png)

```sh
5: Khai báo đường dẫn như sau
http://IP_CUA_MAY_CHU_ZABBIX/zabbix/api_jsonrpc.php

6: Chọn proxy

7: Tài khoản của Zabbix 

8: Mật khẩu của Zabbix
```

![plugincpu](/images/grafana-zabbix3.png)
