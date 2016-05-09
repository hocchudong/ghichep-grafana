##Mục lục 
*	[1. Grafana logical model](#model)
*	[2. Grafana Dashboard](#dashboard)
	*	[2.1.	Pie Chart](#pie)
	*	[2.2	Graph](#graph)
	*	[2.3	Singlestat](#single)
*	[3. Reset admin password](#password)
	
<a name="model"> </a> 
###1. Mô hình logic Grafana kết hợp Graphite và Collectd
<img src="http://i.imgur.com/5GWXWLB.png">

<a name="dashboard"> </a> 
###2. Hướng dẫn tạo Dashboard giám sát các host trên Grafana 3.0
Kịch bản : Đã có sẵn các host được giám sát bởi Graphite và Collectd.
####Các bước cài đặt
Add Graphite cho Grafana
![graphite](/images/Gra1.png)
![graphite](/images/Gra2.png)

3: Tên của DataSource

4: Khai báo URL của Graphite

![graphite](/images/Gra3.png)
Ấn `Test Connection`, nếu kết quả trả về như hình nghĩa là đã add source thành công.
####Tạo một Dashboard mới để giám sát các host từ Graphite
![graphite](/images/Gra4.png)
![graphite](/images/Gra5.png)

Trong bài sẽ hướng dẫn tạo 3 biểu đồ thông dụng:

 - 2.1 Pie Chart : Thích hợp để thể hiện các dạng như RAM, Disk Usage.

 - 2.2 Graphp : Thích hợp để thể hiện các dạng như Network Traffic, CPU Utilization.

 - 2.3 Singlestat : Thể hiện 1 số liệu cụ thể như System Uptime, RAM, Disk Total

<a name="pie"> </a> 
####2.1 Pie Chart
![graphite](/images/Gra6.png)

Mục 1 : **Gerenal**

 - 1: Title của biểu đồ</ul>
 - 2: Kích thước chiều ngang của biểu đồ
 - 3: Kích thước chiều dài của biểu đồ
 - 4: Thêm thông tin nếu muốn link tới một Dashboard hoăc URL khác

![graphite](/images/Gra8.png)

Mục 2: **Metrics**

 - 1: Chọn host
 - 2,3 : Chọn thông số muốn hiển thị của host
 - 4: Dùng function alias để đặt tên khác ở ô 5

![graphite](/images/Gra9.png)

Thay thế legend name với tên ngắn gọn là **FREE**

![graphite](/images/Gra10.png)

Tạo thêm một query với mục đích hiển thị tổng số dung lượng RAM đã sử dụng.

 - 3: Chọn thống số là `memory-buffered`

 - 4: Sử dụng function tính tổng là `sumSeries()`, ở trong ta điền thông số `memory-cached, memory-used`, hàm `sumSeries()` sẽ tính tổng 3 thông số
là memory-buffer, cached và used, hiển thị tên biểu đồ với tên là `USED`


Cách lấy tên đầy đủ cho thống số ở mục 4:

![graphite](/images/Gra7.png)
![graphite](/images/Gra11.png)

Chọn đơn vị hiển thị là `byte` và legend name hiển thị trên graph

<a name="graph"> </a> 
####2.2 Graph
![graphite](/images/Gra12.png)

Mục 1 và 2 cách các thông số vẫn giống vẫn kiểu Pie Chart ( chú ý chọn thông số phù hợp với dạng biểu đồ Graph)

Mục 3: **Axes**

- Mục này để điều chỉnh các thông số ở trục X và Y
- Ta chọn đơn vị hiển thị là của Network Traffic là kilobits/sec, ở trục Y bên trái

Mục 4: **Legend**
 - Mục này để tùy chỉnh các thông số liên quan đến `lengend`
 
 - Ta có thể chọn các kiểu hiển thị của `legend` cũng như các giá trị của lenged

Chọn Decimals = 2 để các giá trị chỉ lấy 2 đơn vị thập phân sau dấu ","

<a name="single"> </a> 
####2.3 Singlestat
![graphite](/images/Gra16.png)
 - Mục 1 và 2 các thống số vẫn giống với các kiểu biểu đồ khác 

 - Mục 3, thống số ta lấy ở đây là `System Uptime` nên đơn vị sẽ là `second(s)`

Tùy chọn thêm `Colonng` nếu muốn đặt ngưỡng cho các thông số này.

Ví dụ Dashboard hoàn chỉnh : 

![graphite](/images/Gra17.png)
<a name="password"> </a>
###3. Reset admin password
Cài đặt database sqlite cho Grafana
```sh
sudo apt-get update
sudo apt-get install sqlite3 libsqlite3-dev
```
Cú pháp reset password admin
```sh
sudo sqlite3 /var/lib/grafana/grafana.db

sqlite> update user set password = '59acf18b94d7eb0694c61e60ce44c110c7a683ac6a8f09580d626f90f4a242000746579358d77dd9e570e83fa24faa88a8a6', salt = 'F3FAxVm33R' where login = 'admin';
sqlite> .exit
```
Lúc này password của user admin đăng nhập trên dashboard sẽ trở lại mặc định là `admin`
