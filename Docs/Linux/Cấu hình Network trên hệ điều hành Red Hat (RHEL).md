# Hướng Dẫn Cấu Hình Mạng Sử Dụng `network-scripts` Trên CentOS, Rocky Linux, và AlmaLinux.

1. Xác định tên card mạng

Đầu tiên, xác định tên của card mạng bạn muốn cấu hình:

```bash
ip a

2. Chỉnh Sửa Tệp Cấu Hình
Các cấu hình mạng được lưu trữ trong thư mục /etc/sysconfig/network-scripts/. Tệp cấu hình có tên theo định dạng ifcfg-<tên-cards-mạng>. Ví dụ: ifcfg-ens33.

Chỉnh sửa hoặc tạo tệp cấu hình cho card mạng cụ thể:
```bash
sudo vi /etc/sysconfig/network-scripts/ifcfg-ens33

3. Cấu Hình Địa Chỉ IP Tĩnh
Dưới đây là ví dụ về cấu hình địa chỉ IP tĩnh cho card mạng ens33:

```bash
ini
Copy code
DEVICE=ens33
BOOTPROTO=static
ONBOOT=yes
IPADDR=192.168.1.100
NETMASK=255.255.255.0
GATEWAY=192.168.1.1
DNS1=8.8.8.8
DNS2=8.8.4.4
Giải thích các tham số:

DEVICE: Tên card mạng.
BOOTPROTO: Cách cấu hình IP (static cho IP tĩnh, dhcp cho IP động).
ONBOOT: Nếu yes, card mạng sẽ tự động được kích hoạt khi khởi động.
IPADDR: Địa chỉ IP tĩnh.
NETMASK: Mặt nạ mạng.
GATEWAY: Địa chỉ IP của cổng mạng.
DNS1 và DNS2: Địa chỉ DNS để phân giải tên miền.

4. Khởi Động Lại Dịch Vụ Mạng
Sau khi chỉnh sửa tệp cấu hình, khởi động lại dịch vụ mạng để áp dụng các thay đổi:

text
Copy code
sudo systemctl restart network
