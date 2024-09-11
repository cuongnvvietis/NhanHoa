# Hướng Dẫn Khôi Phục (Restore) Bằng Veeam Backup & Replication

## Mục Lục
1. [Yêu Cầu Trước Khi Khôi Phục](#yêu-cầu-trước-khi-khôi-phục)
2. [Các Phương Pháp Khôi Phục](#các-phương-pháp-khôi-phục)
3. [Khôi Phục Máy Ảo (Full VM Recovery)](#khôi-phục-máy-ảo-full-vm-recovery)
4. [Khôi Phục File Riêng Lẻ](#khôi-phục-file-riêng-lẻ)
5. [Khôi Phục Từ Backup Copy](#khôi-phục-từ-backup-copy)

---

## Yêu Cầu Trước Khi Khôi Phục

1. Đảm bảo bạn có bản sao lưu hợp lệ trong **Backup Repository**.
2. Đảm bảo hệ thống đích có đủ tài nguyên để khôi phục các máy ảo hoặc dữ liệu.
3. Kiểm tra kết nối giữa **Veeam Backup Server** và hệ thống ảo hoá (ví dụ: ESXi).
4. Đảm bảo rằng repository không bị lỗi hoặc mất kết nối.

---

## Các Phương Pháp Khôi Phục

1. **Full VM Recovery (Khôi Phục Máy Ảo Toàn Bộ):** Khôi phục toàn bộ máy ảo từ bản sao lưu.
2. **File-Level Recovery (Khôi Phục Từng File):** Khôi phục từng file hoặc thư mục riêng lẻ từ bản sao lưu.
3. **Instant VM Recovery:** Khởi chạy máy ảo trực tiếp từ bản sao lưu mà không cần khôi phục đầy đủ.

---

## Khôi Phục Máy Ảo (Full VM Recovery)

1. **Mở Veeam Backup & Replication:**
   - Khởi chạy **Veeam Backup & Replication Console** trên máy chủ quản lý.

2. **Chọn Máy Ảo Cần Khôi Phục:**
   - Vào **Home** > **Backups** > **Disk** để xem danh sách các bản sao lưu.
   - Nhấp chuột phải vào bản sao lưu của máy ảo mà bạn muốn khôi phục và chọn **Restore entire VM**.

   ![Chọn máy ảo để khôi phục](https://github.com/cuongnvvietis/NhanHoa/blob/main/Docs/Esxi/Picture/Veem/Screenshot_74.png)

3. **Chọn Loại Khôi Phục:**
   - Chọn phương thức khôi phục phù hợp, ví dụ: **Restore to the original location** (Khôi phục đến vị trí ban đầu) hoặc **Restore to a new location** (Khôi phục đến vị trí mới).

4. **Cấu Hình Khôi Phục:**
   - Nếu chọn khôi phục đến vị trí mới, bạn sẽ phải nhập lại thông tin như tên máy ảo mới, chọn ESXi host và datastore để lưu trữ.

5. **Chạy Quá Trình Khôi Phục:**
   - Xác nhận các lựa chọn và nhấn **Finish** để bắt đầu quá trình khôi phục máy ảo.

   ![Hình ảnh quá trình khôi phục](https://github.com/cuongnvvietis/NhanHoa/blob/main/Docs/Esxi/Picture/Veem/Screenshot_74.png)

---

## Khôi Phục File Riêng Lẻ

1. **Chọn File-Level Recovery:**
   - Trong **Backup & Replication Console**, vào **Home** > **Backups** > **Disk**.
   - Nhấp chuột phải vào bản sao lưu và chọn **Restore guest files** > **Microsoft Windows** (hoặc hệ điều hành tương ứng).

2. **Khởi Chạy File-Level Restore Wizard:**
   - Chọn bản sao lưu và nhấn **Next** để tiếp tục quá trình khôi phục file.

3. **Chọn File Cần Khôi Phục:**
   - Trình wizard sẽ hiển thị hệ thống file trong máy ảo sao lưu, bạn có thể duyệt và chọn file hoặc thư mục cần khôi phục.

4. **Chạy Quá Trình Khôi Phục:**
   - Chọn thư mục đích và bắt đầu quá trình khôi phục file.

---

## Khôi Phục Từ Backup Copy

1. **Chọn Backup Copy:**
   - Từ giao diện **Backup & Replication Console**, chọn **Home** > **Backups** > **Backup Copy**.

2. **Chọn Máy Ảo Hoặc File Cần Khôi Phục:**
   - Tương tự như quá trình khôi phục từ bản sao lưu gốc, nhấp chuột phải vào bản sao lưu và chọn **Restore entire VM** hoặc **Restore guest files**.

3. **Chạy Quá Trình Khôi Phục:**
   - Làm theo các bước tương tự như khi khôi phục từ bản sao lưu gốc để hoàn thành quá trình.

---

## Lưu Ý

- **Thời Gian Khôi Phục:** Thời gian khôi phục phụ thuộc vào kích thước bản sao lưu và tốc độ của hệ thống mạng.
- **Khôi Phục Tại Vị Trí Mới:** Khi khôi phục máy ảo đến vị trí mới, đảm bảo cấu hình hệ thống không xung đột với các máy ảo hiện tại.
- **Kiểm Tra Dữ Liệu:** Sau khi khôi phục, kiểm tra lại hệ thống để đảm bảo rằng máy ảo hoặc file đã khôi phục hoạt động đúng như mong đợi.
