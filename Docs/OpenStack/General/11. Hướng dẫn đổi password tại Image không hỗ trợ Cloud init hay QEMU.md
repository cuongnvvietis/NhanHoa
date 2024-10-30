# Hướng dẫn Chỉnh sửa và Tải lại Image lên OpenStack

## Mục tiêu
Hướng dẫn này sẽ hướng dẫn bạn cách chỉnh sửa mật khẩu trong một image và tải lại image đó lên OpenStack.

## Các bước cụ thể

### Bước 1: Truy cập File Image Gốc
Tải file image gốc lên máy chủ deployment đã cài đặt sẵn libguestfs-tools

        sudo apt install -y libguestfs-tools

### Bước 2: Chỉnh sửa Mật khẩu trong Image
Sử dụng `virt-customize` để thiết lập lại mật khẩu:

    sudo virt-customize -a /home/cuongnv/<ten-image>.qcow2 --root-password password:123456a@
    
Lệnh này sẽ thiết lập mật khẩu root thành 123456a@ cho image.

![Command Prompt](https://github.com/cuongnvvietis/NhanHoa/blob/main/Docs/Picture/Openstack/Screenshot_102.png)

### Bước 3: Tải lại Image về và upload lên Openstack với tài khoản root và mật khẩu là 123456a@
