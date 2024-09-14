# Hướng Dẫn Cài Đặt Ubuntu Server

## 1. Chuẩn Bị

### 1.1. Tải Ubuntu Server ISO

1. Truy cập trang web chính thức của Ubuntu tại [Ubuntu Downloads](https://ubuntu.com/download/server).
2. Tải xuống phiên bản Ubuntu Server mà bạn muốn cài đặt, ví dụ, phiên bản 20.04 LTS.

### 1.2. Tạo USB Cài Đặt

#### **Trên Windows**

1. Sử dụng công cụ [Rufus](https://rufus.ie/) hoặc [balenaEtcher](https://www.balena.io/etcher/).
2. Chọn tệp ISO Ubuntu Server đã tải xuống và USB drive của bạn.
3. Chọn định dạng ổ đĩa là **MBR** cho BIOS hoặc **GPT** cho UEFI, tùy thuộc vào loại BIOS/UEFI của máy tính.
4. Nhấn `Start` để tạo USB bootable.

## 2. Cài Đặt Ubuntu Server

### 2.1. Khởi Động Từ USB

1. Cắm USB vào máy tính hoặc máy chủ.
2. Khởi động lại máy và vào BIOS/UEFI để thay đổi thứ tự khởi động, chọn USB là thiết bị khởi động đầu tiên.
3. Lưu thay đổi và khởi động lại máy tính.

### 2.2. Cài Đặt Hệ Điều Hành

1. Khi khởi động từ USB, bạn sẽ thấy màn hình cài đặt Ubuntu Server.
2. Chọn ngôn ngữ và nhấn `Enter`.
3. Chọn `Install Ubuntu Server` và nhấn `Enter`.
4. Làm theo hướng dẫn để cấu hình mạng, phân vùng đĩa, và cài đặt các gói phần mềm cần thiết.

   - **Chia Đĩa:**
     - **/boot:** 1GB, định dạng ext4.
     - **swap:** 8GB, loại phân vùng swap.
     - **/:** Phân vùng còn lại, định dạng LVM hoặc ext4 (tùy chọn).

5. Sau khi hoàn tất cấu hình, hệ thống sẽ bắt đầu cài đặt. Quá trình này có thể mất vài phút.
5. Sau khi hoàn tất cấu hình, hệ thống sẽ bắt đầu cài đặt. Quá trình này có thể mất vài phút.

### 2.3. Cấu Hình Sau Cài Đặt

1. Sau khi cài đặt hoàn tất, khởi động lại máy tính.
2. Đảm bảo loại bỏ USB cài đặt trước khi hệ thống khởi động lại.
3. Đăng nhập vào hệ thống và thực hiện các cấu hình bổ sung nếu cần.

## 3. Kiểm Tra Cài Đặt

1. Kiểm tra phiên bản Ubuntu Server:
    ```bash
    lsb_release -a
    ```
2. Kiểm tra trạng thái hệ thống:
    ```bash
    df -h
    ```
3. Kiểm tra các dịch vụ đang chạy:
    ```bash
    systemctl list-units --type=service
    ```

## 4. Tài Liệu Tham Khảo

- [Ubuntu Server Installation Guide](https://ubuntu.com/server/docs/installation)
- [Ubuntu Server Documentation](https://ubuntu.com/server/docs)

---

Hãy đảm bảo rằng bạn đã sao lưu tất cả dữ liệu quan trọng trước khi thực hiện cài đặt hệ điều hành mới. Nếu có bất kỳ câu hỏi hoặc vấn đề nào, hãy tham khảo tài liệu chính thức hoặc cộng đồng Ubuntu.
