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

Nếu ổ cứng mới không được phát hiện, bạn cần cài đặt `scsitools` và thực hiện quét SCSI:

      sudo apt update
      sudo apt install
      scsitools sudo rescan-scsi-bus

1. **Mở Terminal** và sử dụng `fdisk` để tạo phân vùng mới:
   
      sudo fdisk /dev/sdb


2. Trong `fdisk`, thực hiện các bước sau:
 - Nhấn `n` để tạo phân vùng mới.
 - Chọn kiểu phân vùng (primary hoặc logical).
 - Chấp nhận các giá trị mặc định hoặc nhập kích thước phân vùng bạn muốn (thường là toàn bộ ổ đĩa).
 - Nhấn `w` để lưu và thoát.

## Thêm Phân Vùng Mới Vào Volume Group

1. **Khởi Tạo Partition Mới Cho LVM**:





