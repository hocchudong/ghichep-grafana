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
```sh 
3: Tên của DataSource
4: Khai báo URL của Graphite
```
![graphite](/images/Gra3.png)
Ấn `Test Connection`, nếu kết quả trả về như hình nghĩa là đã add source thành công.
####Tạo một Dashboard mới để giám sát các host từ Graphite
![graphite](/images/Gra4.png)
![graphite](/images/Gra5.png)
```sh
Trong bài sẽ hướng dẫn tạo 3 biểu đồ thông dụng:
1.1 Pie Chart : Thích hợp để thể hiện các dạng như RAM, Disk Usage.
1.2 Graphp : Thích hợp để thể hiện các dạng như Network Traffic, CPU Utilization.
1.3 Singlestat : Thể hiện 1 số liệu cụ thể như System Uptime, RAM, Disk Total
```
####1.1 Pie Chart
![graphite](/images/Gra6.png)
```sh
Mục 1 : **Gerenal**
1: Title của biểu đồ
2: Kích thước chiều ngang của biểu đồ
3: Kích thước chiều dài của biểu đồ
4: Thêm thông tin nếu muốn link tới một Dashboard hoăc URL khác
```
![graphite](/images/Gra8.png)
```sh 
Mục 2: **Metrics**
1: Chọn host 
2,3 : Chọn thông số muốn hiển thị của host
4: Dùng function *alias* để đặt tên khác ở ô 5
```
![graphite](/images/Gra9.png)
```sh
Thay thế legend name với tên ngắn gọn là **FREE**
```
![graphite](/images/Gra10.png)
```sh
Tạo thêm một query với mục đích hiển thị tổng số dung lượng RAM đã sử dụng.
3: Chọn thống số là *memory-buffered*
4: Sử dụng function tính tổng là *sumSeries()*, ở trong ta điền thông số *memory-cached, memory-used*, hàm *sumSeries()* sẽ tính tổng 3 thông số
là memory-buffer, cached và used, hiển thị tên biểu đồ với tên là **USED**
```
```sh
Cách lấy tên đầy đủ cho thống số ở mục 4:
```
![graphite](/images/Gra7.png)
