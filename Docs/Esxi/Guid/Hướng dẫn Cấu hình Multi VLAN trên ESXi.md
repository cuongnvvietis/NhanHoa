# Hướng dẫn Cấu hình Multi VLAN trên ESXi

## Mục tiêu

Hướng dẫn này sẽ giúp bạn cấu hình nhiều VLAN trên máy chủ ESXi bằng cách tạo một vSwitch tên là `SW-TRUNK` và thêm các Port Groups cho VLAN 10 và VLAN 20.

## Điều kiện tiên quyết

1. Máy chủ ESXi đã được cài đặt và chạy.
2. Bạn có quyền truy cập root hoặc quyền quản trị tương đương trên máy chủ ESXi.

## Bước 1: Đăng nhập vào ESXi Host

1. Mở trình duyệt web và truy cập vào giao diện web của ESXi Host (thường là `https://[ESXi-Host-IP-Address]`).
2. Đăng nhập bằng tài khoản quản trị viên.

## Bước 2: Tạo Virtual Switch (vSwitch) mới

1. Trong giao diện web của ESXi, đi tới **Networking**.
2. Chọn **Virtual Switches** và nhấp vào **Add standard switch**.
   ![Tạo vSwitch](https://github.com/cuongnvvietis/NhanHoa/blob/main/Docs/Esxi/Picture/Network/Screenshot_64.png)
3. Nhập tên là `SW-TRUNK` cho vSwitch mới.
4. Chọn **Add** để hoàn tất việc tạo vSwitch.

## Bước 3: Tạo Port Groups cho VLAN

1. Chọn vSwitch `SW-TRUNK` từ danh sách các Virtual Switches.
2. Nhấp vào **Edit Settings**.
3. Trong phần **Ports**, chọn **Add** để thêm một Port Group mới.
4. Nhập tên cho Port Group là `VLAN 10` và cấu hình VLAN ID là `10`. Nhấp vào **OK** để lưu.
5. Lặp lại quy trình để tạo một Port Group khác với tên là `VLAN 11` và VLAN ID là `11`.

   ![Cấu hình VLAN](https://github.com/cuongnvvietis/NhanHoa/blob/main/Docs/Esxi/Picture/Network/Screenshot_65.png)

## Bước 4: Gán Port Groups cho các VM

1. Đi tới **Virtual Machines** trong giao diện web.
2. Chọn VM mà bạn muốn gán VLAN.
3. Chỉnh sửa cài đặt của VM và chọn **Network Adapter**.
4. Chọn Port Group `VLAN 10` hoặc `VLAN 10` từ danh sách tùy thuộc vào VLAN mà bạn muốn gán.
5. Lưu các thay đổi.

## Bước 5: Kết quả

   ![Kết quả](https://github.com/cuongnvvietis/NhanHoa/blob/main/Docs/Esxi/Picture/Network/Screenshot_66.png)

## Kết luận

Bạn đã hoàn tất việc cấu hình Multi VLAN trên ESXi với vSwitch `SW-TRUNK` và các Port Groups cho VLAN 10 và VLAN 20. Lưu lượng mạng của các VLAN sẽ được phân tách hiệu quả.

---

Nếu bạn có thêm câu hỏi hoặc cần hỗ trợ, đừng ngần ngại liên hệ.
