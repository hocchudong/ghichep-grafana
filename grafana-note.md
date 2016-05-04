## Các chú ý trong grafana

### Các điểm mới trong bản 2.x

- Từ bản 2.0 trở đi, khai báo datasource đã được đưa lên dashboard nên không phải khai báo trong file `config.js` như trước nữa (bản 1.x trở về trước).
- Việc khai báo datasource trên dashboard sẽ sử dụng database để lưu trữ do vậy không cần sử dụng Elasticsearch nữa. 
- Grafana 2.0 không hỗ trợ lưu Dashboard trong InfluxDB.

### Các điểm mới trong bản 3.x
- Có thêm piechart