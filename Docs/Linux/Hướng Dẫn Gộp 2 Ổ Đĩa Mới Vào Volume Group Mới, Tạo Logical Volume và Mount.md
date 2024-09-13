# Hướng Dẫn Gộp 2 Ổ Đĩa Mới Vào Volume Group Mới, Tạo Logical Volume và Mount Vào `/nhanhoa`

## Mục Lục
1. [Chuẩn Bị](#chuẩn-bị)
2. [Tạo Physical Volume (PV)](#tạo-physical-volume-pv)
3. [Tạo Volume Group (VG)](#tạo-volume-group-vg)
4. [Tạo Logical Volume (LV)](#tạo-logical-volume-lv)
5. [Tạo Hệ Thống Tập Tin trên LV và Mount](#tạo-hệ-thống-tập-tin-trên-lv-và-mount)
6. [Cập Nhật `/etc/fstab`](#cập-nhật-etcfstab)

## 1. Chuẩn Bị

Đảm bảo rằng bạn đã có hai ổ đĩa mới (`/dev/sdb` và `/dev/sdc`) đã được thêm vào hệ thống của bạn.

![Command Prompt](https://github.com/cuongnvvietis/NhanHoa/blob/main/Docs/Esxi/Picture/Disk/Screenshot_116.png)

## 2. Tạo Physical Volume (PV)

Chạy các lệnh sau để tạo PV trên hai ổ đĩa mới:
  
    sudo pvcreate /dev/sdb
    sudo pvcreate /dev/sdc

 ![Command Prompt](https://github.com/cuongnvvietis/NhanHoa/blob/main/Docs/Esxi/Picture/Disk/Screenshot_117.png)
 
## 3. Tạo Volume Group (VG)

Tạo một Volume Group mới với tên là vg_nhanhoa:

    sudo vgcreate vg_nhanhoa /dev/sdb /dev/sdc

  ![Command Prompt](https://github.com/cuongnvvietis/NhanHoa/blob/main/Docs/Esxi/Picture/Disk/Screenshot_118.png)
  
## 4. Tạo Logical Volume (LV)

Tạo một Logical Volume mới với tên là lv_nhanhoa từ Volume Group vg_nhanhoa. Giả sử bạn muốn sử dụng toàn bộ dung lượng của VG:

    sudo lvcreate -l 100%FREE -n lv_nhanhoa vg_nhanhoa
 ![Command Prompt](https://github.com/cuongnvvietis/NhanHoa/blob/main/Docs/Esxi/Picture/Disk/Screenshot_119.png)    
 
## 5. Tạo Hệ Thống Tập Tin trên LV và Mount
Trước khi mount, bạn cần định dạng Logical Volume mới với hệ thống tập tin ext4:

    sudo mkfs.ext4 /dev/vg_nhanhoa/lv_nhanhoa
 ![Command Prompt](https://github.com/cuongnvvietis/NhanHoa/blob/main/Docs/Esxi/Picture/Disk/Screenshot_120.png)   
Tạo điểm mount /nhanhoa và mount Logical Volume vào điểm này:

    sudo mkdir /nhanhoa
    sudo mount /dev/vg_nhanhoa/lv_nhanhoa /nhanhoa

## 6. Cập Nhật /etc/fstab

Để tự động mount LV vào /nhanhoa sau khi khởi động lại hệ thống, bạn cần cập nhật file /etc/fstab. Trước tiên, lấy UUID của Logical Volume:

    sudo blkid /dev/vg_nhanhoa/lv_nhanhoa
    
Ghi chú UUID và cập nhật file /etc/fstab:

    UUID=<UUID> /nhanhoa ext4 defaults 0 2
    Thay <UUID> bằng UUID bạn đã ghi chú.

Lưu các thay đổi và kiểm tra cấu hình:

![Command Prompt](https://github.com/cuongnvvietis/NhanHoa/blob/main/Docs/Esxi/Picture/Disk/Screenshot_122.png)
Xác Nhận
Để kiểm tra, bạn có thể sử dụng các lệnh sau:

    lsblk
    df -h
![Command Prompt](https://github.com/cuongnvvietis/NhanHoa/blob/main/Docs/Esxi/Picture/Disk/Screenshot_121.png)
