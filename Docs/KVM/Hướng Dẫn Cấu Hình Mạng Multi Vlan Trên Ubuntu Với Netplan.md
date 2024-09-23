# Hướng Dẫn Cấu Hình Mạng Multi Vlan Trên Ubuntu Với Netplan

## 1. Mở File Cấu Hình Netplan

Mở terminal và sử dụng trình soạn thảo bạn thích (ví dụ: `nano` hoặc `vim`) để chỉnh sửa file cấu hình Netplan. File cấu hình thường nằm ở `/etc/netplan/`.

    sudo nano /etc/netplan/00-installer-config.yaml
## 2. Cấu Hình Mạng
Dán cấu hình sau vào file:

    network:
      version: 2
      ethernets:
        eno1:
          dhcp4: no
          addresses:
            - 172.16.2.7/20
          routes:
            - to: 0.0.0.0/0
              via: 172.16.10.1  # Gateway cho Internet
        eno3:
          dhcp4: no
      vlans:
        vlan10:
          id: 10
          link: eno3
        vlan11:
          id: 11
          link: eno3
      bridges:
        br-vlan10:
          interfaces:
            - vlan10
          dhcp4: no
          addresses:
            - 10.10.10.189/24
          routes:
            - to: 10.10.10.0/24
              via: 10.10.10.1
        br-vlan11:
          interfaces:
            - vlan11
          dhcp4: no
          addresses:
            - 10.10.11.189/24
          routes:
            - to: 10.10.11.0/24
              via: 10.10.11.1

![Command Prompt](https://github.com/cuongnvvietis/NhanHoa/blob/main/Docs/Picture/KVM/Screenshot_56.png) 

## 3. Áp Dụng Cấu Hình
Sau khi chỉnh sửa xong, lưu file và áp dụng cấu hình bằng lệnh:

    sudo netplan apply
## 4. Kiểm Tra Kết Nối
Để kiểm tra trạng thái mạng, bạn có thể sử dụng lệnh:

    ip a

![Command Prompt](https://github.com/cuongnvvietis/NhanHoa/blob/main/Docs/Picture/KVM/Screenshot_57.png) 

## 5. Cấu hình cho máy ảo nhận Vlan

Connect tới các máy ảo bằng lệnh 

        virt-manager
Sau khi connect xong vào setting chọn card mạng là Bridge 10 hoặc Bridge 11 đã tạo ở đầu

![Command Prompt](https://github.com/cuongnvvietis/NhanHoa/blob/main/Docs/Picture/KVM/Screenshot_58.png) 

## 6. Cấu hình IP cho máy ảo 

![Command Prompt](https://github.com/cuongnvvietis/NhanHoa/blob/main/Docs/Picture/KVM/Screenshot_59.png) 

## 7. Kiểm tra

![Command Prompt](https://github.com/cuongnvvietis/NhanHoa/blob/main/Docs/Picture/KVM/Screenshot_55.png) 

