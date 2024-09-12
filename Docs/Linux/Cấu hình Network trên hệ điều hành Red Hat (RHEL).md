# Cấu Hình Mạng Trên Centos, RockyLinux .. 

## 1. `Network-Scripts`

### Cấu Hình

1. **Tạo Tập Tin Cấu Hình `network-scripts`**

   Các cấu hình mạng được lưu trữ trong thư mục /etc/sysconfig/network-scripts/. Tệp cấu hình có tên theo định dạng ifcfg-<tên-cards-mạng>. Ví dụ: ifcfg-ens33

   ```bash
   sudo vi /etc/sysconfig/network-scripts/ifcfg-ens33

   DEVICE=ens33
BOOTPROTO=static
ONBOOT=yes
IPADDR=192.168.1.100
NETMASK=255.255.255.0
GATEWAY=192.168.1.1
DNS1=8.8.8.8
DNS2=8.8.4.4

   sudo netplan apply
            
2. **Tạo Tập Tin Cấu Hình `netplan`**
    ```bash
     systemctl status NetworkManager
     nmcli connection modify eth0 ipv4.addresses 192.168.1.100/24
     nmcli connection modify eth0 ipv4.gateway 192.168.1.1
     nmcli connection modify eth0 ipv4.dns "8.8.8.8,8.8.4.4"
     nmcli connection modify eth0 ipv4.method manual
     nmcli connection down eth0
     nmcli connection up eth0


