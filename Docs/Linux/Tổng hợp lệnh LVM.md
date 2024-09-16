# Hướng dẫn Quản lý Logical Volume Manager (LVM) trên Linux

Trong hướng dẫn này, bạn sẽ tìm thấy các câu lệnh cơ bản và phổ biến để quản lý LVM trên Linux.
        
    sudo apt update
    sudo apt install scsitools
    sudo rescan-scsi-bus
    echo "- - -" | sudo tee /sys/class/scsi_host/host*/scan
    sudo mkfs.ext4 /dev/sdd1
    sudo mount /dev/sxxx /data
    sudo resize2fs /dev/mapper/vg_data-lv_data (Khi lsblk nhận mà df-h không nhận)
    sudo xfs_growfs / (Khi lsblk nhận mà df-h không nhận)
    UUID=c780f3bc-9ab5-4a4a-a243-99083c7ea7e8  /data  ext4  defaults  0  2



## 1. Quản lý Physical Volumes (PV)
Tạo Physical Volume:

    sudo pvcreate /dev/sdX
Xem thông tin Physical Volume:

    sudo pvdisplay
Xóa Physical Volume:

    sudo pvremove /dev/sdX
## 2. Quản lý Volume Groups (VG)
Tạo Volume Group:

    sudo vgcreate vg_name /dev/sdx1
Xem thông tin Volume Group:

    sudo vgdisplay
Mở rộng Volume Group:

    sudo vgextend vg_name /dev/sdX
Xóa ổ khỏi Volume Group:

    sudo vgreduce vg_name /dev/sdX
Xóa Volume Group:

        sudo vgremove vg_name
Move dữ liệu

        sudo pvmove /dev/sdf /dev/sdg

## 3. Quản lý Logical Volumes (LV)
Tạo Logical Volume:

    sudo lvcreate -n lv_name -L 31 vg_name
Xem thông tin Logical Volume:

    sudo lvdisplay
Mở rộng Logical Volume:

    sudo lvextend -L +size /dev/vg_name/lv_name
Hoặc sử dụng toàn bộ dung lượng còn lại:

    sudo lvextend -l +100%FREE /dev/vg_name/lv_name
Thu hẹp Logical Volume:

    sudo lvreduce -L -size /dev/vg_name/lv_name
Xóa Logical Volume:

    sudo lvremove /dev/vg_name/lv_name
## 4. Các lệnh khác
Tạo Snapshot của Logical Volume:

    sudo lvcreate -s -n snapshot_name -L size /dev/vg_name/lv_name
Xóa Snapshot:

    sudo lvremove /dev/vg_name/snapshot_name
Xem tất cả Logical Volumes, Volume Groups, và Physical Volumes:

    sudo lvs
    sudo vgs
    sudo pvs   
Tạo Volume Group từ Physical Volumes mới:

    sudo vgcreate vg_name /dev/sdX /dev/sdY
Thêm PV vào VG:

    sudo vgextend vg_name /dev/sdX  
Loại bỏ PV khỏi VG:

    sudo vgreduce vg_name /dev/sdX
Khôi phục VG nếu thiếu PV:

    sudo vgextend --restoremissing vg_name
Cập nhật kích thước hệ thống tệp sau khi mở rộng LV:

sudo resize2fs /dev/vg_name/lv_name

## 5. Các lệnh khẩn cấp
Khôi phục PV bị mất:

    sudo vgextend --restoremissing vg_name  
Lưu ý: Trước khi thực hiện các thay đổi quan trọng như thu hẹp hoặc xóa các Logical Volume, hãy sao lưu dữ liệu quan trọng để tránh mất mát dữ liệu.
