# Hướng Dẫn Phục Hồi Máy Ảo (VM) Từ Tệp OVF Bằng vCenter

Phục hồi một máy ảo từ tệp OVF qua vCenter là một quy trình đơn giản và hiệu quả. Dưới đây là hướng dẫn từng bước để thực hiện việc này.

## Bước 1: Đăng Nhập vào vCenter

1. **Mở Trình Duyệt Web**:
   - Mở trình duyệt web và truy cập vào địa chỉ của vCenter Server.

2. **Đăng Nhập**:
   - Nhập tên người dùng và mật khẩu để đăng nhập vào giao diện vSphere Client.

## Bước 2: Truy Cập Menu Import OVF

1. **Chọn Deploy OVF Template**:
   - Nhấp vào **Actions** và chọn **Deploy OVF Template** từ menu.

   ![Deploy OVF Template](https://github.com/cuongnvvietis/NhanHoa/blob/main/Docs/Esxi/Picture/Restore/Screenshot_31.png)

## Bước 3: Chọn Tệp OVF

1. **Chọn Nguồn OVF**:
   - Trong giao diện Deploy OVF Template, chọn **Local File** hoặc **URL** để chọn tệp OVF từ máy tính của bạn hoặc từ một địa chỉ URL.

2. **Chọn Tệp OVF và VMDK**:
   - Duyệt và chọn tệp OVF và các tệp VMDK liên quan.

   ![Select OVF and VMDK](https://github.com/cuongnvvietis/NhanHoa/blob/main/Docs/Esxi/Picture/Restore/Screenshot_32.png)

## Bước 4: Đặt Tên và Chọn Thư Mục

1. **Đặt Tên Cho Máy Ảo**:
   - Đặt tên cho máy ảo và chọn thư mục nơi sẽ lưu trữ máy ảo trong vCenter.

   ![Name and Folder](https://github.com/cuongnvvietis/NhanHoa/blob/main/Docs/Esxi/Picture/Restore/Screenshot_33.png)

## Bước 5: Chọn Tài Nguyên Tính Toán (Compute Resource)

1. **Chọn Host hoặc Cluster**:
   - Chọn host hoặc cluster nơi bạn muốn triển khai máy ảo.

   ![Select Host or Cluster](https://github.com/cuongnvvietis/NhanHoa/blob/main/Docs/Esxi/Picture/Restore/Screenshot_34.png)

## Bước 6: Chọn Lưu Trữ (Storage)

1. **Chọn Datastore**:
   - Chọn datastore mà bạn muốn lưu trữ cấu hình và đĩa ảo của máy ảo.

   ![Select Storage](https://github.com/cuongnvvietis/NhanHoa/blob/main/Docs/Esxi/Picture/Restore/Screenshot_36.png)

## Bước 7: Cấu Hình Network

1. **Cấu Hình Network**:
   - Chọn các network mà máy ảo sẽ kết nối đến. Bạn có thể phải cấu hình các adapter mạng để phù hợp với cấu hình mạng của bạn.

   ![Configure Network](https://github.com/cuongnvvietis/NhanHoa/blob/main/Docs/Esxi/Picture/Restore/Screenshot_37.png)

## Bước 8: Xem Lại Chi Tiết

1. **Kiểm Tra Thông Tin**:
   - Kiểm tra tất cả các thông tin đã chọn, bao gồm tên máy ảo, tài nguyên tính toán, lưu trữ, và cấu hình mạng.
