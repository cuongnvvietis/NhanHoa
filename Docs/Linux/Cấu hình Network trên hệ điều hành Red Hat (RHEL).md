# Cấu Hình Mạng Trên Centos, RockyLinux .. 

## 1. `Network-Scripts`

### Cấu Hình

1. **Tạo Tập Tin Cấu Hình `network-scripts`**

   Các cấu hình mạng được lưu trữ trong thư mục /etc/sysconfig/network-scripts/. Tệp cấu hình có tên theo định dạng ifcfg-<tên-cards-mạng>. Ví dụ: ifcfg-ens33

   ```bash
   sudo nano /etc/netplan/01-netcfg.yaml

   network:
    version: 2
    renderer: networkd
    ethernets:
      eth0:
        dhcp4: no
        addresses:
          - 192.168.1.100/24
        gateway4: 192.168.1.1
        nameservers:
          addresses:
            - 8.8.8.8
            - 8.8.4.4

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


