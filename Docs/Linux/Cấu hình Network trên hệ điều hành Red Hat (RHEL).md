# Hướng Dẫn Cấu Hình Mạng Sử Dụng `network-scripts` Trên CentOS, Rocky Linux, và AlmaLinux

## 1. Xác Định Tên Card Mạng

Đầu tiên, xác định tên của card mạng bạn muốn cấu hình:

```bash
ip a

## 2. Chỉnh Sửa Tệp Cấu Hình
Các cấu hình mạng được lưu trữ trong thư mục /etc/sysconfig/network-scripts/. Tệp cấu hình có tên theo định dạng ifcfg-<tên-cards-mạng>. Ví dụ: ifcfg-ens33.
sudo vi /etc/sysconfig/network-scripts/ifcfg-ens33
Chỉnh sửa hoặc tạo tệp cấu hình cho card mạng cụ thể:

## 3. Cấu Hình Địa Chỉ IP Tĩnh
Dưới đây là ví dụ về cấu hình địa chỉ IP tĩnh cho card mạng ens33:
DEVICE=ens33
BOOTPROTO=static
ONBOOT=yes
IPADDR=192.168.1.100
NETMASK=255.255.255.0
GATEWAY=192.168.1.1
DNS1=8.8.8.8
DNS2=8.8.4.4

## 4. Khởi Động Lại Dịch Vụ Mạng
Sau khi chỉnh sửa tệp cấu hình, khởi động lại dịch vụ mạng để áp dụng các thay đổi:
sudo systemctl restart network
