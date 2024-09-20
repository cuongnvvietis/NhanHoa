# Quản lý Máy Ảo với KVM/QEMU

Dưới đây là một số lệnh phổ biến để quản lý các máy ảo trên KVM/QEMU thông qua `virsh`.

## 1. Liệt kê tất cả các máy ảo
    virsh list --all
## 2. Khởi động máy ảo
    virsh start <vm-name>
Thay <vm-name> bằng tên của máy ảo mà bạn muốn khởi động.
## 3. Tắt máy ảo
    virsh shutdown <vm-name> 
## 4. Buộc tắt máy ảo (Hard Shutdown)
    virsh destroy <vm-name>
Lưu ý: Lệnh này tương đương với việc rút nguồn điện đột ngột, có thể gây mất dữ liệu.
## 5. Khởi động lại dịch vụ libvirtd
    sudo systemctl restart libvirtd
## 6. Xem thông tin chi tiết về một máy ảo
    virsh dominfo <vm-name>
## 7. Xóa máy ảo
    virsh undefine <vm-name>
Nếu muốn xóa cả đĩa ảo (disk), sử dụng thêm tham số --remove-all-storage:
    virsh undefine <vm-name> --remove-all-storage
## 8. Kết nối đến console của máy ảo
    virsh console <vm-name>
Nếu gặp lỗi "Active console session exists", có thể khởi động lại dịch vụ hoặc kiểm tra các phiên điều khiển đang mở.
## 9. Tạm dừng và tiếp tục máy ảo
    virsh suspend <vm-name>
    virsh resume <vm-name>
