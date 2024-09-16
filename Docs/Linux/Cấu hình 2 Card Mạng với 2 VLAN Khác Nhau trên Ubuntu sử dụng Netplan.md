# Cấu hình 2 Card Mạng với 2 VLAN Khác Nhau trên Ubuntu sử dụng Netplan

**Mô tả:** Hướng dẫn cấu hình hai card mạng, mỗi card có một địa chỉ IP trong một VLAN khác nhau sử dụng `netplan` trên Ubuntu.

## 1. Cấu hình Card Mạng

Để cấu hình hai card mạng `ens192` và `ens224` với các địa chỉ IP trong các VLAN khác nhau, hãy tạo hoặc chỉnh sửa tập tin cấu hình Netplan.

**Tập tin cấu hình: `/etc/netplan/00-installer-config.yaml`**

    ```yaml
    network:
    version: 2
    renderer: networkd
    
    ethernets:
      ens160:
        dhcp4: no  # Không sử dụng DHCP cho ens160
        addresses:
          - 172.16.2.68/20  # Địa chỉ IP thứ nhất
          - 172.16.2.240/20  # Địa chỉ IP thứ hai
        routes:
        - to: 0.0.0.0/0
          via: 172.16.10.1  # Gateway cho ens160
        - to: 172.16.2.0/20
          via: 172.16.10.1  # Gateway cho ens160
      nameservers:
        addresses:
          - 8.8.8.8  # DNS

    ens192:
      dhcp4: no  # Không sử dụng DHCP cho ens192
      # ens192 sẽ được cấu hình cho VLAN 10

    ens224:
      dhcp4: no  # Không sử dụng DHCP cho ens224
      # ens224 sẽ được cấu hình cho VLAN 11

    vlans:
      vlan10:
        id: 10
        link: ens192  # Sử dụng ens192 cho VLAN 10
        addresses:
          - 10.10.10.180/24  # Địa chỉ IP cho VLAN 10
        routes:
          - to: 10.10.10.0/24
            via: 10.10.10.1  # Gateway cho VLAN 10
        nameservers:
          addresses:
            - 8.8.8.8  # DNS
  
      vlan11:
        id: 11
        link: ens224  # Sử dụng ens224 cho VLAN 11
        addresses:
          - 10.10.11.180/24  # Địa chỉ IP cho VLAN 11
        routes:
          - to: 10.10.11.0/24
            via: 10.10.11.1  # Gateway cho VLAN 11
        nameservers:
          addresses:
            - 8.8.8.8  # DNS

## 2. Áp Dụng Cấu Hình

    sudo netplan apply

## 3. Kiểm Tra Cấu Hình

    ip addr show
    
  Ping thử từ máy tính cùng Vlan tới 2 IP 

   ![Command Prompt](https://github.com/cuongnvvietis/NhanHoa/blob/main/Docs/Esxi/Picture/Network/Screenshot_136.png) 

 Ping thử ra internet và traceroute
 
  ![Command Prompt](https://github.com/cuongnvvietis/NhanHoa/blob/main/Docs/Esxi/Picture/Network/Screenshot_137.png) 
