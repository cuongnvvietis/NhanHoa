
# Hướng dẫn khắc phục lỗi kết nối SSH trong WebVirtCloud

Lỗi phổ biến: **"Problem occurred with host ssh: Cannot recv data: Host key verification failed"**  
Dưới đây là các bước chi tiết để khắc phục lỗi này.

---

## Mô hình
- **Máy chủ chạy WebVirtCloud**: `172.16.2.7`
- **Máy khách (host KVM)**: `172.16.2.227`

---

## 1. Kiểm tra thư mục `.ssh` trên máy chạy WebVirtCloud
1. Truy cập vào máy chủ chạy WebVirtCloud (`172.16.2.7`).
2. Kiểm tra thư mục `.ssh` của user chạy ứng dụng (thường là `www-data`):
   ```bash
   sudo -u www-data ls -ld /var/www/.ssh
   ```
3. Nếu thư mục chưa tồn tại, tạo mới và thiết lập quyền:
   ```bash
   sudo mkdir -p /var/www/.ssh
   sudo chown -R www-data:www-data /var/www/.ssh
   sudo chmod 700 /var/www/.ssh
   ```

---

## 2. Tạo khóa SSH
1. Tạo cặp khóa SSH cho user `www-data` trên máy chủ `172.16.2.7`:
   ```bash
   sudo -u www-data ssh-keygen -t rsa -b 4096 -f /var/www/.ssh/id_rsa -N ''
   ```
2. Lưu ý:
   - Đường dẫn file khóa là `/var/www/.ssh/id_rsa`.
   - Không đặt mật khẩu khi được hỏi.

---

## 3. Thêm khóa SSH lên máy khách (host KVM)
1. Copy khóa công khai `id_rsa.pub` từ máy chủ `172.16.2.7` tới máy khách `172.16.2.227`:
   ```bash
   sudo -u www-data ssh-copy-id -i /var/www/.ssh/id_rsa.pub root@172.16.2.227
   ```

---

## 4. Cập nhật danh sách `known_hosts`
1. Thêm khóa máy khách vào danh sách `known_hosts` để tránh lỗi xác minh khóa:
   ```bash
   sudo -u www-data ssh-keyscan -H 172.16.2.227 >> /var/www/.ssh/known_hosts
   ```
2. Đảm bảo quyền chính xác cho file `known_hosts`:
   ```bash
   sudo chown www-data:www-data /var/www/.ssh/known_hosts
   sudo chmod 600 /var/www/.ssh/known_hosts
   ```

---

## 5. Kiểm tra kết nối SSH
1. Kiểm tra kết nối từ máy chủ `172.16.2.7` tới máy khách `172.16.2.227`:
   ```bash
   sudo -u www-data ssh -i /var/www/.ssh/id_rsa root@172.16.2.227
   ```
2. Kết nối thành công nếu không yêu cầu nhập mật khẩu.

---

## 6. Kiểm tra WebVirtCloud
1. Đăng nhập vào giao diện WebVirtCloud trên `172.16.2.7` qua trình duyệt.
2. Thử kết nối tới máy khách `172.16.2.227` hoặc thực hiện các hành động bị lỗi trước đó để đảm bảo mọi thứ hoạt động chính xác.

---

## Lưu ý:
1. Đảm bảo **dịch vụ SSH** đang chạy trên máy khách `172.16.2.227`:
   ```bash
   sudo systemctl status ssh
   ```
2. Đảm bảo **cổng SSH** được mở trên firewall của máy khách:
   ```bash
   sudo ufw allow ssh
   ```
3. Nếu vẫn gặp lỗi, kiểm tra log của WebVirtCloud tại:
   ```bash
   sudo tail -f /var/log/webvirtcloud/*.log
   ```

