# Cấu hình 2 Card Mạng Mỗi Card 1 IP Cùng VLAN với Netplan

Hướng dẫn này mô tả cách cấu hình hai địa chỉ IP trên hai card mạng khác nhau trong cùng một VLAN sử dụng `netplan` trên Ubuntu.

## 1. Cấu hình Card Mạng

  Tạo hoặc cập nhật tập tin cấu hình Netplan để thiết lập địa chỉ IP cho các card mạng. Ví dụ: `ens160` và `ens192`.

  **Tập tin cấu hình: `/etc/netplan/01-netcfg.yaml`**

    ```bash
    network:
    version: 2
    ethernets:
    ens160:
      dhcp4: no
      addresses:
        - 172.16.2.49/20
      gateway4: 172.16.10.1
      nameservers:
        addresses:
          - 8.8.8.8
          - 8.8.4.4
    ens192:
      dhcp4: no
      addresses:
        - 172.16.2.50/20
      gateway4: 172.16.10.1
      nameservers:
        addresses:
          - 8.8.8.8
          - 8.8.4.4

## 2. Áp Dụng Cấu Hình

    sudo netplan apply

## 3. Kiểm Tra Cấu Hình

    ip addr show
    
  Ping thử từ máy tính bên ngoài tới 2 IP 

   ![Command Prompt](https://github.com/cuongnvvietis/NhanHoa/blob/main/Docs/Esxi/Picture/Network/Screenshot_136.png) 

 Ping thử ra internet và traceroute
 
  ![Command Prompt](https://github.com/cuongnvvietis/NhanHoa/blob/main/Docs/Esxi/Picture/Network/Screenshot_137.png) 
