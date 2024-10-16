Chỉnh cấu hình nova.conf trên máy compute:

Mở tệp /etc/nova/nova.conf:

    sudo nano /etc/nova/nova.conf
Tìm và thêm vào phần [libvirt]:

    [libvirt]
    cpu_mode=custom
    cpu_model=core2duo  # Hoặc loại CPU khác phù hợp
Lưu lại thay đổi và khởi động lại dịch vụ:

    sudo systemctl restart nova-compute
Kiểm tra cấu hình libvirt:

Kiểm tra bằng lệnh:

    virsh capabilities
Tìm loại CPU phù hợp và chỉnh lại cpu_model như trên.
