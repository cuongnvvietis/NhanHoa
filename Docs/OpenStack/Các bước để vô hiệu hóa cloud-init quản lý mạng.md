Các bước để vô hiệu hóa cloud-init quản lý mạng:
Tạo file 99-disable-network-config.cfg:

Tạo file bằng lệnh sau:

bash
Copy code
sudo touch /etc/cloud/cloud.cfg.d/99-disable-network-config.cfg
Chỉnh sửa file 99-disable-network-config.cfg:

Mở file vừa tạo và thêm nội dung sau để vô hiệu hóa cloud-init quản lý mạng:

bash
Copy code
sudo nano /etc/cloud/cloud.cfg.d/99-disable-network-config.cfg
Thêm nội dung sau:

yaml
Copy code
network: {config: disabled}
Lưu file và thoát.
