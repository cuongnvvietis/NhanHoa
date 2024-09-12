# Hướng Dẫn Reset Mật Khẩu Tài Khoản Root trên CentOS 7

Nếu bạn quên mật khẩu tài khoản root trên CentOS 7, bạn có thể thực hiện theo các bước sau để reset mật khẩu.

## Bước 1: Khởi Động lại Máy Tính

1. Khởi động lại máy tính của bạn.
2. Khi máy tính bắt đầu khởi động, nhấn phím `e` hoặc phím tương ứng để vào menu GRUB.

## Bước 2: Vào Chế Độ Khôi Phục

1. Trong menu GRUB, chọn phiên bản CentOS mà bạn muốn khởi động và nhấn phím `e` để chỉnh sửa.
2. Tìm dòng bắt đầu bằng `linux16` hoặc `linux` (tùy thuộc vào hệ thống của bạn).
3. Thêm `rd.break` vào cuối dòng đó. Điều này sẽ đưa bạn vào chế độ khôi phục.
4. Nhấn `Ctrl + X` để khởi động.
   ![Chỉnh sửa GRUB](https://github.com/cuongnvvietis/NhanHoa/blob/main/Docs/Esxi/Picture/Reset%20Password/Screenshot_98.png)

## Bước 3: Mount Hệ Thống

1. Hệ thống sẽ khởi động vào chế độ khôi phục và bạn sẽ thấy dấu nhắc `sh#`.
2. Gõ lệnh sau để mount hệ thống file:
   ```bash
   mount -o remount,rw /sysroot
   chroot /sysroot
   passwd
   touch /.autorelabel
   rm -f /.autorelabel

   exit
   exit

   ![Chỉnh sửa GRUB](https://github.com/cuongnvvietis/NhanHoa/blob/main/Docs/Esxi/Picture/Reset%20Password/Screenshot_99.png)
