### Các chú ý trong grafana

- Từ bản 2.0 trở đi, khai báo datasource đã được đưa lên dashboard nên không phải khai báo trong file config.js như trước nữa.
- Việc khai báo datasource trên dashboard sẽ sử dụng database để lưu trữ do vậy không cần sử dụng Elasticsearch nữa.
