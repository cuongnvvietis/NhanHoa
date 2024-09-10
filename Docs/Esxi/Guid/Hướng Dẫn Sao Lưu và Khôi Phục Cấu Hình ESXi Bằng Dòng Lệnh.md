# Hướng Dẫn Sao Lưu và Khôi Phục Cấu Hình ESXi Bằng Dòng Lệnh (CLI)

## Giới Thiệu
Hướng dẫn này sẽ giúp bạn sao lưu và khôi phục cấu hình của máy chủ ESXi bằng cách sử dụng dòng lệnh (CLI). Quá trình bao gồm việc sử dụng các lệnh ESXi CLI để sao lưu cấu hình và khôi phục lại khi cần thiết.

## Sao Lưu Cấu Hình

1. **Kết Nối Với Máy Chủ ESXi Qua SSH**
   - Đảm bảo bạn đã bật SSH trên máy chủ ESXi và kết nối vào máy chủ qua SSH bằng công cụ như PuTTY hoặc Terminal trên hệ điều hành Unix/Linux.
   ![Kết nối SSH](https://github.com/cuongnvvietis/NhanHoa/blob/main/Docs/Esxi/Picture/Backup/Screenshot_73.png)

2. **Đồng Bộ Hóa Cấu Hình**
   - Chạy lệnh sau để đảm bảo tất cả các thay đổi cấu hình được lưu vào file mục tiêu:
     ```bash
     vim-cmd hostsvc/firmware/sync_config
     ```
   ![Đồng bộ hóa cấu hình](https://github.com/cuongnvvietis/NhanHoa/blob/main/Docs/Esxi/Picture/Backup/Screenshot_67.png)

3. **Tạo Liên Kết Sao Lưu**
   - Chạy lệnh sau để tạo liên kết tải xuống file chứa cấu hình máy chủ:
     ```bash
     vim-cmd hostsvc/firmware/backup_config
     ```
   - Liên kết tải xuống sẽ được cung cấp dưới dạng URL, ví dụ: `http://<IP-Address>/downloads/123456/configBundle-xx.xx.xx.xx.tgz`. Thay `<IP-Address>` bằng địa chỉ IP hoặc FQDN của máy chủ.
   ![Tạo liên kết sao lưu](https://github.com/cuongnvvietis/NhanHoa/blob/main/Docs/Esxi/Picture/Backup/Screenshot_67.png)

4. **Tải Xuống File Sao Lưu**
   - Mở trình duyệt web và dán liên kết đã tạo vào thanh địa chỉ. Nhấn Enter để tải xuống file cấu hình. File này sẽ được lưu trong thư mục Downloads với tên chứa “configBundle” và FQDN của máy chủ.

## Khôi Phục Cấu Hình

1. **Đổi Tên File Sao Lưu**
   - Đổi tên file sao lưu thành `configBundle.tgz`.
   ![Đổi tên file sao lưu](https://github.com/cuongnvvietis/NhanHoa/blob/main/Docs/Esxi/Picture/Backup/Screenshot_70.png)

2. **Vào Chế Độ Bảo Trì**
   - Chạy lệnh sau để đưa máy chủ ESXi vào chế độ bảo trì:
     ```bash
     vim-cmd hostsvc/maintenance_mode_enter
     ```
   ![Chế độ bảo trì](https://github.com/cuongnvvietis/NhanHoa/blob/main/Docs/Esxi/Picture/Backup/Screenshot_71.png)

3. **Sao Chép File Sao Lưu**
   - Sao chép file `configBundle.tgz` vào máy chủ ESXi trong đường dẫn /tmp. Bạn có thể sử dụng SCP hoặc các phương pháp khác để thực hiện việc này.

4. **Giải nén tệp `configBundle.tgz`**
   ```bash
     cd /tmp
     tar -xzvf configBundle-localhost.tgz
     tar -xzvf state.tgz
     tar -xzvf local.tgz
     ```
   
   ![Chế độ bảo trì](https://github.com/cuongnvvietis/NhanHoa/blob/main/Docs/Esxi/Picture/Backup/Screenshot_72.png)
6. **Khôi Phục Cấu Hình**
   - Chạy lệnh sau để khôi phục cấu hình từ file sao lưu:
     ```bash
     vim-cmd hostsvc/firmware/restore_config /backup_location/configBundle.tgz
     ```
   - Thay `/backup_location` bằng thư mục thực tế nơi bạn đã sao chép file sao lưu.
   ![Khôi phục cấu hình](https://github.com/cuongnvvietis/NhanHoa/blob/main/Docs/Esxi/Picture/Backup/Screenshot_66.png)
