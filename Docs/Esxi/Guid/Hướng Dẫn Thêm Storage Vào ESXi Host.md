# Hướng Dẫn Thêm Storage Vào ESXi Host

Dưới đây là các bước cơ bản để thêm **datastore** vào ESXi host.

## 1. Đăng Nhập vào vSphere Client
- Mở **vSphere Client** trên trình duyệt và đăng nhập vào tài khoản quản trị viên của ESXi host.

## 2. Đi Tới Storage
- Trong giao diện vSphere Client, chọn **ESXi host** mà bạn muốn thêm storage.
- Chuyển sang tab **Configure** trong phần điều khiển.
- Tại mục **Storage**, chọn **Datastores**.

![Đi Tới Storage](https://github.com/cuongnvvietis/NhanHoa/blob/main/Docs/Esxi/Picture/Add%20Storage/Screenshot_25.png)

## 3. Thêm Datastore
- Nhấp vào **New Datastore** ở góc phải màn hình.

![Thêm Datastore](https://github.com/cuongnvvietis/NhanHoa/blob/main/Docs/Esxi/Picture/Add%20Storage/Screenshot_26.png)

## 4. Chọn Loại Datastore
- Một cửa sổ mới sẽ xuất hiện, chọn loại **VMFS** để sử dụng với ổ cứng hoặc **NFS** nếu bạn đang sử dụng lưu trữ mạng.

![Chọn Loại Datastore](https://github.com/cuongnvvietis/NhanHoa/blob/main/Docs/Esxi/Picture/Add%20Storage/Screenshot_27.png)

## 5. Đặt Tên và Chọn Storage Device
- Đặt tên cho datastore mới.
- Chọn ổ đĩa hoặc thiết bị lưu trữ mà bạn muốn add vào ESXi host.

![Đặt Tên và Chọn Storage Device](https://github.com/cuongnvvietis/NhanHoa/blob/main/Docs/Esxi/Picture/Add%20Storage/Screenshot_28.png)

## 6. Chọn dung lượng cần thêm
- Kéo dài thanh hoặc chọn dung lượng bạn muốn thêm. Ở đây tôi chọn full dung lượng của ổ

![Đặt Tên và Chọn Storage Device](https://github.com/cuongnvvietis/NhanHoa/blob/main/Docs/Esxi/Picture/Add%20Storage/Screenshot_29.png)
## 6. Xác Nhận và Hoàn Thành
- Xác nhận các thiết lập và nhấn **Finish** để hoàn tất quá trình thêm storage.

![Xác Nhận và Hoàn Thành](https://github.com/cuongnvvietis/NhanHoa/blob/main/Docs/Esxi/Picture/Add%20Storage/Screenshot_30.png)

Khi hoàn tất, datastore mới sẽ xuất hiện trong danh sách **Datastores** và có thể được sử dụng để lưu trữ các máy ảo (VMs) hoặc dữ liệu khác.

## Lưu ý
- Kiểm tra cẩn thận thiết bị lưu trữ trước khi thêm để tránh mất dữ liệu.
