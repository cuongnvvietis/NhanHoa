# Hướng Dẫn Mở Rộng Phân Vùng Gốc Với Ổ Cứng Mới Trên Ubuntu

## Mục Lục
1. [Giới Thiệu](#giới-thiệu)
2. [Chuẩn Bị](#chuẩn-bị)
3. [Tạo Phân Vùng Mới Trên Ổ Cứng Mới](#tạo-phân-vùng-mới-trên-ổ-cứng-mới)
4. [Thêm Phân Vùng Mới Vào Volume Group](#thêm-phân-vùng-mới-vào-volume-group)
5. [Mở Rộng Logical Volume](#mở-rộng-logical-volume)
6. [Mở Rộng Hệ Thống Tệp](#mở-rộng-hệ-thống-tệp)
7. [Kiểm Tra Kết Quả](#kiểm-tra-kết-quả)
8. [Tài Liệu Tham Khảo](#tài-liệu-tham-khảo)

## Giới Thiệu

Hướng dẫn này mô tả cách mở rộng phân vùng gốc (`/`) trên Ubuntu bằng cách sử dụng ổ cứng mới. Hướng dẫn sẽ giúp bạn thêm không gian từ ổ đĩa mới vào phân vùng gốc của bạn, sử dụng LVM (Logical Volume Manager).

## Chuẩn Bị

1. **Máy chủ hoặc Máy Ảo Đã Cài Đặt Ubuntu**: Với phân vùng gốc sử dụng LVM.
2. **Ổ Cứng Mới Được Kết Nối**: Đã được phát hiện dưới dạng `/dev/sdb`.

## Tạo Phân Vùng Mới Trên Ổ Cứng Mới

1. **Mở Terminal** và sử dụng `fdisk` để tạo phân vùng mới:
Nếu ổ cứng mới không được phát hiện ngay lập tức, bạn cần cài đặt scsitools và thực hiện quét SCSI:
   ```bash
sudo apt update
sudo apt install scsitools
sudo rescan-scsi-bus
   ```bash
   sudo fdisk /dev/sdb
Nhấn n để tạo phân vùng mới.
Chọn kiểu phân vùng (primary hoặc logical).
Chấp nhận các giá trị mặc định hoặc nhập kích thước phân vùng bạn muốn (thường là toàn bộ ổ đĩa).
Nhấn w để lưu và thoát.
Thêm Phân Vùng Mới Vào Volume Group
Khởi Tạo Partition Mới Cho LVM:

bash
Sao chép mã
sudo pvcreate /dev/sdb1
Thêm Physical Volume Vào Volume Group:

Xác định Volume Group hiện tại của bạn:

bash
Sao chép mã
sudo vgdisplay
Thêm phân vùng mới vào Volume Group:

bash
Sao chép mã
sudo vgextend ubuntu-vg /dev/sdb1
Mở Rộng Logical Volume
Xác Định Logical Volume Hiện Tại:

Kiểm tra Logical Volume hiện tại:

bash
Sao chép mã
sudo lvdisplay
Mở Rộng Logical Volume:

Sử dụng lvextend để mở rộng Logical Volume. Ví dụ: mở rộng Logical Volume ubuntu-lv trong Volume Group ubuntu-vg để sử dụng toàn bộ không gian mới:

bash
Sao chép mã
sudo lvextend -l +100%FREE /dev/ubuntu-vg/ubuntu-lv
Hoặc nếu bạn chỉ muốn mở rộng thêm một kích thước cụ thể, ví dụ 5GB:

bash
Sao chép mã
sudo lvextend -L +5G /dev/ubuntu-vg/ubuntu-lv
Mở Rộng Hệ Thống Tệp
Sử Dụng resize2fs Để Mở Rộng Hệ Thống Tệp:

Đối với hệ thống tệp ext4:

bash
Sao chép mã
sudo resize2fs /dev/ubuntu-vg/ubuntu-lv
Đối với hệ thống tệp XFS (nếu bạn đang sử dụng XFS):

bash
Sao chép mã
sudo xfs_growfs /
Kiểm Tra Kết Quả
Sau khi hoàn tất, kiểm tra kích thước phân vùng gốc để đảm bảo rằng không gian đã được mở rộng thành công:

bash
Sao chép mã
df -h
