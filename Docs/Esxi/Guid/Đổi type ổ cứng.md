# Hướng Dẫn Chuyển Đổi Ổ Đĩa từ Thick Provision Sang Thin Provision

## 1. Xác Nhận Định Dạng Hiện Tại của Ổ Đĩa

Để xác nhận định dạng của ổ đĩa hiện tại, sử dụng lệnh sau:
```bash
vmkfstools -P /vmfs/volumes/[datastore]/[path-to-vmdk].vmdk

2. Chạy Lệnh Chuyển Đổi
Để chuyển đổi ổ đĩa từ Thick Provision sang Thin Provision, sử dụng lệnh sau:

bash
Sao chép mã
vmkfstools -i /vmfs/volumes/[datastore]/[path-to-vmdk].vmdk /vmfs/volumes/[datastore]/[path-to-new-thin-vmdk].vmdk -d thin
3. Gán Ổ Đĩa Mới vào Máy Ảo
Mở vSphere Client và đăng nhập.
Chỉnh sửa cấu hình máy ảo và thêm ổ đĩa mới.
Chọn tệp ổ đĩa với định dạng Thin Provision.
4. Khởi Động Lại Máy Ảo
Khởi động lại máy ảo và kiểm tra ổ đĩa mới trong hệ điều hành.
Sao chép mã
Commit và Đẩy Tài Liệu Lên GitHub:

Lưu tệp tài liệu và commit thay đổi.
Đẩy tài liệu lên GitHub.
