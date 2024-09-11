# Hướng Dẫn Reset Password trên Ubuntu 18.04

Nếu bạn quên mật khẩu của tài khoản người dùng trên Ubuntu 18.04, bạn có thể thực hiện theo các bước sau để reset mật khẩu.

## Bước 1: Khởi Động lại Máy Tính

1. Khởi động lại máy tính của bạn.
2. Khi thấy màn hình GRUB, hãy nhấn phím `Shift` (hoặc `Esc` nếu bạn đang sử dụng UEFI) để hiển thị menu GRUB.
   ![Màn hình GRUB](https://github.com/cuongnvvietis/NhanHoa/blob/main/Docs/Esxi/Picture/Reset%20Password/Screenshot_109.png)

## Bước 2: Vào Chế Độ Recovery Mode

1. Trong menu GRUB, chọn phiên bản Ubuntu của bạn và nhấn phím `e` để sửa đổi các tham số khởi động.
2. Tìm dòng bắt đầu bằng `linux` và thêm `rw init=/bin/bash` vào cuối dòng đó.
3. Nhấn `Ctrl + X` hoặc `F10` để khởi động vào chế độ Recovery.
   ![Chế độ Recovery Mode](https://github.com/cuongnvvietis/NhanHoa/blob/main/Docs/Esxi/Picture/Reset%20Password/Screenshot_96.png)

## Bước 3: Reset Mật Khẩu

1. Khi vào được dòng lệnh, bạn sẽ thấy dấu nhắc `#`.
2. Gõ lệnh sau để đổi mật khẩu cho tài khoản người dùng của bạn (thay `username` bằng tên người dùng của bạn):
   ```bash
   passwd root 

![Chế độ Recovery Mode](https://github.com/cuongnvvietis/NhanHoa/blob/main/Docs/Esxi/Picture/Reset%20Password/Screenshot_97.png)
