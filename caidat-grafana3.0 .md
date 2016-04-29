##Ghi chép cài đặt và sử dụng Grafana 3.0 ( phiên bản Beta)
- Cài đặt grafana 3.x
```sh
wget https://grafanarel.s3.amazonaws.com/builds/grafana_3.0.0-beta11459429091_amd64.deb
sudo apt-get install -y adduser libfontconfig
sudo dpkg -i grafana_3.0.0-beta11459429091_amd64.deb
```

***
###Mô hình logic Grafana kết hợp Graphite và Collectd
<img src="http://i.imgur.com/5GWXWLB.png">

###Hướng dẫn tạo Dashboard giám sát các host trên Grafana 3.0
Kịch bản : Đã có sẵn các host được giám sát bởi Graphite và Collectd.
####Các bước cài đặt
Add Graphite cho Grafana
![graphite](/images/Gra1.png)
![graphite](/images/Gra2.png)
```
3: Tên của DataSource
4: Khai báo URL của Graphite
```
![graphite](/images/Gra3.png)
Ấn `Test Connection`, nếu kết quả trả về như hình nghĩa là đã add source thành công.