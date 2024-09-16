# Cấu hình 2 IP trên 1 Card Mạng Khác VLAN

Hướng dẫn này mô tả cách cấu hình hai địa chỉ IP trên một card mạng với các VLAN khác nhau sử dụng `network-scripts` trên AlmaLinux.

## 1. Cấu hình Card Mạng

Tạo tập tin cấu hình cho card mạng gốc. Ví dụ, card mạng của bạn là `ens224`.

**Tập tin cấu hình: `/etc/sysconfig/network-scripts/ifcfg-ens224`**

    ```ini
    DEVICE=ens224
    ONBOOT=yes
    BOOTPROTO=none
    TYPE=Ethernet
    VLAN=yes
## 2. Tạo Cấu Hình VLAN

Tạo các tập tin cấu hình cho các VLAN mà bạn muốn cấu hình. Ví dụ: VLAN 10 và VLAN 11 với các địa chỉ IP khác nhau.

VLAN 10
Tập tin cấu hình: /etc/sysconfig/network-scripts/ifcfg-ens224.10

    DEVICE=ens224.10
    BOOTPROTO=static
    ONBOOT=yes
    IPADDR=10.10.10.182
    NETMASK=255.255.255.0
    VLAN=yes
VLAN 11
Tập tin cấu hình: /etc/sysconfig/network-scripts/ifcfg-ens224.11

    DEVICE=ens224.11
    BOOTPROTO=static
    ONBOOT=yes
    IPADDR=10.10.11.182
    NETMASK=255.255.255.0
    VLAN=yes
    systemctl restart network
## 3. Kiểm Tra Cấu Hình

  ![Command Prompt](https://github.com/cuongnvvietis/NhanHoa/blob/main/Docs/Esxi/Picture/Network/Screenshot_134.png) 
