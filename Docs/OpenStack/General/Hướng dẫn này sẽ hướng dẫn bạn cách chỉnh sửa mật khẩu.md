# Hướng dẫn Chỉnh sửa và Tải lại Image lên OpenStack

## Mục tiêu
Hướng dẫn này sẽ hướng dẫn bạn cách chỉnh sửa mật khẩu trong một image và tải lại image đó lên OpenStack.

## Các bước cụ thể

### Bước 1: Truy cập File Image Gốc
Nếu file image đã được lưu trữ trên máy chủ OpenStack và bạn có thể truy cập, hãy sao chép file đó về máy cục bộ hoặc vị trí có thể chỉnh sửa.

### Bước 2: Chỉnh sửa Mật khẩu trong Image
Sử dụng `virt-customize` để thiết lập lại mật khẩu:

    sudo virt-customize -a /home/cuongnv/<ten-image>.qcow2 --root-password password:123456a@
    
Lệnh này sẽ thiết lập mật khẩu root thành 123456a@ cho image.

![Command Prompt](https://github.com/cuongnvvietis/NhanHoa/blob/main/Docs/Picture/Openstack/Screenshot_102.png)
### Bước 3: Tải lại Image lên OpenStack
Sau khi chỉnh sửa xong, bạn có thể tải image lên lại:

      openstack image create --file /home/cuongnv/<ten-image>.qcow2 --disk-format qcow2 --container-format bare <ten-image-moi>
Thay <ten-image-moi> bằng tên bạn muốn đặt cho image mới.

### Bước 4: Tạo lại VM từ Image Mới

Sau khi đã có image mới, bạn có thể khởi tạo lại VM từ image này với mật khẩu đã được cập nhật:

      openstack server create --image <ten-image-moi> --flavor m1.medium --network <network-name> <ten-vm-moi>
Thay <network-name> bằng tên mạng mà bạn muốn sử dụng và <ten-vm-moi> là tên của VM mới.
