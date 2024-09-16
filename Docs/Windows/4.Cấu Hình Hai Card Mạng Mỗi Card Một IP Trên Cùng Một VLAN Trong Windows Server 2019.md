# Cấu Hình NIC Team Với VLAN 10 Trên Windows Server 2019

Hướng dẫn này mô tả cách tạo NIC Team với hai card mạng (NIC), cấu hình VLAN 10 ngay trong lúc tạo NIC Team trên Windows Server 2019.

## 1. Mở Server Manager

1. Nhấn `Windows + R` để mở hộp thoại **Run**.
2. Gõ `ServerManager` và nhấn **Enter** để mở **Server Manager**.

## 2. Truy Cập NIC Teaming

1. Trong **Server Manager**, chọn **Local Server** từ bảng điều khiển bên trái.
2. Tìm phần **NIC Teaming** trong phần **Properties** và nhấp vào liên kết **Disabled** (hoặc **Disabled** nếu bạn chưa cấu hình NIC Teaming).

## 3. Tạo NIC Team và Cấu Hình VLAN 10

1. Trong cửa sổ **NIC Teaming**, nhấp vào **Tasks** và chọn **New Team** để bắt đầu quá trình tạo NIC Team mới.

2. Trong cửa sổ **New Team**, thực hiện các bước sau:
   - **Team name**: Nhập tên cho NIC Team (ví dụ: `Team1`).
   - **Adapaters**: Chọn các card mạng mà bạn muốn thêm vào team (ví dụ: `Ethernet1` và `Ethernet2`).
   - **Team mode**: Chọn chế độ team (ví dụ: **Switch Independent**, **Static Teaming**, hoặc **LACP**).
   - **Load balancing mode**: Chọn chế độ Load Balancing (ví dụ: **Address Hash**, **Hyper-V Port**, v.v.).

3. Nhấp vào **Additional properties** để mở tùy chọn cấu hình VLAN.

4. **Cấu Hình VLAN Trên NIC Team**:
   - Trong mục **Primary team interface**, chọn card mạng mà bạn muốn cấu hình VLAN 10.
   - Nhấp vào **Advanced**.
   - Tìm và chọn **VLAN ID** hoặc **VLAN Tagging**.
   - Nhập VLAN ID là `10`.
   - Nhấp vào **OK** để lưu cấu hình VLAN.

5. Nhấp vào **OK** để tạo team và áp dụng cấu hình.

## 4. Cấu Hình Địa Chỉ IP Cho NIC Team

1. **Mở Network Connections**:
   - Nhấn `Windows + R`, gõ `ncpa.cpl`, và nhấn **Enter** để mở **Network Connections**.

2. **Cấu Hình Địa Chỉ IP Cho NIC Team**:
   - Trong cửa sổ **Network Connections**, nhấp chuột phải vào NIC Team vừa tạo (ví dụ: `Team1`) và chọn **Properties**.
   - Trong cửa sổ **Properties**, chọn **Internet Protocol Version 4 (TCP/IPv4)** và nhấp vào **Properties**.
   - Chọn **Use the following IP address** và nhập địa chỉ IP và **Subnet mask**:
     - **IP Address**: Nhập địa chỉ IP cho VLAN 10 (ví dụ: `10.10.10.185`).
     - **Subnet Mask**: Nhập subnet mask tương ứng (`255.255.255.0`).
   - Nhấp vào **OK** để lưu các thay đổi.

## 5. Kiểm Tra Cấu Hình

1. **Mở Command Prompt**:
   - Nhấn `Windows + R`, gõ `cmd`, và nhấn **Enter**.

2. **Kiểm Tra Địa Chỉ IP**:
   - Sử dụng lệnh `ipconfig` để kiểm tra các địa chỉ IP đã được cấu hình cho NIC Team.

    ```shell
    ipconfig
    ```

3. **Kiểm Tra Kết Nối**:
   - Sử dụng lệnh `ping` để kiểm tra kết nối đến các địa chỉ IP.

    ```shell
    ping 10.10.10.185
    ```

## Ví Dụ Cấu Hình

### NIC Team `Team1`

- **VLAN ID**: `10`
- **IP Address**: `10.10.10.185`
- **Subnet Mask**: `255.255.255.0`

## Kết Luận

Việc cấu hình NIC Team với VLAN ngay trong lúc tạo team giúp đơn giản hóa quá trình thiết lập và đảm bảo rằng NIC Team hoạt động theo đúng yêu cầu VLAN. Đảm bảo kiểm tra cấu hình IP và kết nối để xác nhận rằng hệ thống hoạt động bình thường.

