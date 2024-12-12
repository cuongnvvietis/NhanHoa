# Cấu Hình Dual Gateway trên Rocky Linux

## Mục Tiêu
Hướng dẫn cấu hình dual gateway trên hệ thống Linux (Rocky Linux) để sử dụng hai giao diện mạng với các gateway riêng biệt, thông qua policy-based routing.

---

## **1. Kiểm tra Thông Tin Giao Diện Mạng**
Sử dụng lệnh sau để kiểm tra các giao diện mạng trên hệ thống:

```bash
ip addr show
```

Xác định các giao diện và thông tin IP. Ví dụ:
- Giao diện `enp3s0`: IP `10.10.31.212`, gateway `10.10.31.2`.
- Giao diện `enp7s0`: IP `10.10.32.207`, gateway `10.10.32.2`.

---

## **2. Cấu hình các Bảng Định Tuyến Riêng**

### **2.1. Thêm Bảng Định Tuyến**
Mở tệp `/etc/iproute2/rt_tables` để thêm các bảng định tuyến:

```bash
sudo nano /etc/iproute2/rt_tables
```

Thêm hai dòng cuối cùng:

```text
1 table_enp3s0
2 table_enp7s0
```

Lưu và thoát (`Ctrl+O`, `Ctrl+X`).

---

### **2.2. Cấu hình Định Tuyến cho Từng Giao Diện**
Thêm các tuyến vào từng bảng định tuyến bằng lệnh sau:

#### Định tuyến cho `enp3s0`:
```bash
sudo ip route add 10.10.31.0/24 dev enp3s0 src 10.10.31.212 table table_enp3s0
sudo ip route add default via 10.10.31.2 dev enp3s0 table table_enp3s0
```

#### Định tuyến cho `enp7s0`:
```bash
sudo ip route add 10.10.32.0/24 dev enp7s0 src 10.10.32.207 table table_enp7s0
sudo ip route add default via 10.10.32.2 dev enp7s0 table table_enp7s0
```

---

## **3. Thêm Quy Tắc Định Tuyến (Policy Routing)**
Thêm các quy tắc để mỗi giao diện sử dụng bảng định tuyến riêng:

#### Quy tắc cho `enp3s0`:
```bash
sudo ip rule add from 10.10.31.212 table table_enp3s0
```

#### Quy tắc cho `enp7s0`:
```bash
sudo ip rule add from 10.10.32.207 table table_enp7s0
```

Kiểm tra lại các quy tắc:
```bash
ip rule show
```

Kết quả mong muốn:
```text
0:      from all lookup local
32764:  from 10.10.32.207 lookup table_enp7s0
32765:  from 10.10.31.212 lookup table_enp3s0
32766:  from all lookup main
32767:  from all lookup default
```

---

## **4. Lưu Cấu Hình Vĩnh Viễn**

### **4.1. Tạo Tệp Script Khởi Động**
Tạo một tệp script để áp dụng cấu hình định tuyến sau khi khởi động lại hệ thống:

```bash
sudo nano /etc/rc.d/rc.local
```

Thêm nội dung sau:

```bash
#!/bin/bash
ip route add 10.10.31.0/24 dev enp3s0 src 10.10.31.212 table table_enp3s0
ip route add default via 10.10.31.2 dev enp3s0 table table_enp3s0
ip route add 10.10.32.0/24 dev enp7s0 src 10.10.32.207 table table_enp7s0
ip route add default via 10.10.32.2 dev enp7s0 table table_enp7s0
ip rule add from 10.10.31.212 table table_enp3s0
ip rule add from 10.10.32.207 table table_enp7s0
```

Lưu tệp và cấp quyền thực thi:
```bash
sudo chmod +x /etc/rc.d/rc.local
```

---

### **4.2. Bật rc.local (nếu cần)**
Nếu `rc.local` chưa được bật, kích hoạt nó bằng lệnh sau:
```bash
sudo systemctl enable rc-local
sudo systemctl start rc-local
```

---

## **5. Kiểm Tra Kết Nối**

### **5.1. Ping qua từng giao diện**
- Ping qua `enp3s0`:
  ```bash
  ping -I enp3s0 8.8.8.8
  ```
- Ping qua `enp7s0`:
  ```bash
  ping -I enp7s0 8.8.8.8
  ```

### **5.2. Kiểm tra bảng định tuyến**
- Kiểm tra bảng định tuyến `table_enp3s0`:
  ```bash
  ip route show table table_enp3s0
  ```
- Kiểm tra bảng định tuyến `table_enp7s0`:
  ```bash
  ip route show table table_enp7s0
  ```

---

## **6. Ghi chú**
- Đảm bảo các gateway (`10.10.31.2` và `10.10.32.2`) đều hoạt động và có kết nối ra ngoài.
- Nếu cần sử dụng định tuyến cho dải IP cụ thể, bạn có thể thêm tuyến vào bảng định tuyến liên quan. Ví dụ:
  ```bash
  ip route add 192.168.1.0/24 via 10.10.32.2 dev enp7s0 table table_enp7s0
  ```
- Nếu có vấn đề, kiểm tra logs:
  ```bash
  journalctl -xe
  ```

---

## Kết Luận
Cấu hình dual gateway bằng policy-based routing cho phép hệ thống Linux sử dụng hai giao diện mạng với hai gateway khác nhau mà không xảy ra xung đột định tuyến. Hãy đảm bảo rằng các bước được áp dụng chính xác và kiểm tra kỹ từng phần để tránh lỗi.

![Command Prompt](https://github.com/cuongnvvietis/NhanHoa/blob/main/Docs/Esxi/Picture/Network/Screenshot_268.png)

![Command Prompt](https://github.com/cuongnvvietis/NhanHoa/blob/main/Docs/Esxi/Picture/Network/Screenshot_269.png)

