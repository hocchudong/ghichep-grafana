#### Các ghi chép về Grafana

### Cài đặt grafana

- Môi trường cài đặt
```sh

```

- Các lệnh cài đặt

```sh
echo "deb https://packagecloud.io/grafana/stable/debian/ wheezy main" >> /etc/apt/sources.list

curl https://packagecloud.io/gpg.key | sudo apt-key add -

sudo apt-get update
sudo apt-get install grafana
```

- Khởi động grafana

```sh
sudo service grafana-server start
```

##### Cấu hình cho zabbix

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