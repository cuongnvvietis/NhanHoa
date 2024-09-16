# Hướng Dẫn Cấu Hình Hai Địa Chỉ IP Trên Một Card Mạng Cùng VLAN trên Linux

## Mục Lục

1. [Giới thiệu](#giới-thiệu)
2. [Cấu Hình Mạng](#cấu-hình-mạng)
3. [Áp Dụng Cấu Hình](#áp-dụng-cấu-hình)
4. [Kiểm Tra Cấu Hình](#kiểm-tra-cấu-hình)
5. [Lưu Ý](#lưu-ý)

---

## Giới thiệu

Hướng dẫn này cung cấp cách cấu hình hai địa chỉ IP cho một card mạng cùng VLAN  bằng cách sử dụng Netplan hoặc Network-Scripts. Chúng ta sẽ cấu hình một card mạng `ens192` với hai địa chỉ IP thuộc cùng một VLAN và thiết lập gateway mặc định.

---

## Cấu Hình Mạng

1. Mở file cấu hình Netplan:

   ```bash
   sudo nano /etc/netplan/01-netcfg.yaml
    network:
    ethernets:
    ens192:
      dhcp4: no  # Không sử dụng DHCP cho ens192
      addresses:
        - 172.16.2.68/24  # Địa chỉ IP thứ nhất
        - 172.16.2.67/24  # Địa chỉ IP thứ hai
      routes:
        - to: 0.0.0.0/0
          via: 172.16.10.1  # Gateway cho ens192
      nameservers:
        addresses:
          - 8.8.8.8  # DNS
    sudo netplan apply 

 ![Command Prompt](https://github.com/cuongnvvietis/NhanHoa/blob/main/Docs/Esxi/Picture/Network/Screenshot_132.png) 

    TYPE=Ethernet
    BOOTPROTO=static
    NAME=ens192
    DEVICE=ens192
    ONBOOT=yes
    IPADDR0=172.16.2.89
    NETMASK=255.255.240.0
    IPADDR1=172.16.2.241
    NETMASK=255.255.240.0
    GATEWAY=172.16.10.1
    DNS1=8.8.8.8
    DNS2=8.8.4.4
    
   systemcrt restart network   
 ![Command Prompt](https://github.com/cuongnvvietis/NhanHoa/blob/main/Docs/Esxi/Picture/Network/Screenshot_133.png) 
