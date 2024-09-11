# Cấu Hình Mạng Trên Ubuntu

## 1. `netplan` với `systemd-networkd`

### Tóm Tắt
`netplan` là công cụ cấu hình mạng chính thức trên Ubuntu từ phiên bản 17.10 trở đi, bao gồm 18.04, 20.04, và 22.04. Khi kết hợp với `systemd-networkd`, nó cung cấp một cách cấu hình mạng mạnh mẽ và linh hoạt, đặc biệt phù hợp với môi trường datacenter.

### Cấu Hình

1. **Tạo Tập Tin Cấu Hình `netplan`**

   Tạo hoặc chỉnh sửa tập tin cấu hình YAML trong thư mục `/etc/netplan/`:

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

  systemctl status NetworkManager
  nmcli connection modify eth0 ipv4.addresses 192.168.1.100/24
  nmcli connection modify eth0 ipv4.gateway 192.168.1.1
  nmcli connection modify eth0 ipv4.dns "8.8.8.8,8.8.4.4"
  nmcli connection modify eth0 ipv4.method manual
  nmcli connection down eth0
  nmcli connection up eth0


