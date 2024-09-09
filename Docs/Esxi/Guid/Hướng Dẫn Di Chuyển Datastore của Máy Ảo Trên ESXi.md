# Hướng Dẫn Di Chuyển Datastore của Máy Ảo Trên ESXi

Di chuyển một máy ảo từ datastore này sang datastore khác trên cùng một ESXi host có thể được thực hiện thông qua giao diện web của ESXi. Dưới đây là hướng dẫn chi tiết để thực hiện điều này.

## Bước 1: Đăng Nhập vào Giao Diện Web của ESXi

1. **Mở Trình Duyệt Web**:
   - Mở trình duyệt web và nhập địa chỉ IP của ESXi host để truy cập giao diện quản lý web.

2. **Đăng Nhập**:
   - Nhập tên người dùng và mật khẩu để đăng nhập vào giao diện web của ESXi.

## Bước 2: Tắt Máy Ảo

1. **Chọn Máy Ảo**:
   - Trong giao diện chính của ESXi, chọn tab **Virtual Machines**.

2. **Tắt Máy Ảo**:
   - Nhấp chuột phải vào máy ảo cần di chuyển và chọn **Power** > **Power Off**. Đợi máy ảo tắt hoàn toàn.

## Bước 3: Di Chuyển Datastore

1. **Truy Cập Menu Storage**:
   - Trong giao diện chính, chọn tab **Storage** để xem danh sách các datastore hiện có.

   ![Access Storage](https://github.com/cuongnvvietis/NhanHoa/blob/main/Docs/Esxi/Picture/Move%20Datastore/Screenshot_38.png)

2. **Chọn Datastore Nguồn**:
   - Chọn datastore hiện tại nơi máy ảo đang được lưu trữ.

3. **Chọn Thư Mục Máy Ảo**:
   - Trong datastore nguồn, chọn thư mục chứa máy ảo cần di chuyển.

4. **Di Chuyển File Máy Ảo**:
   - Nhấp chuột phải vào thư mục hoặc các tệp của máy ảo và chọn **Move** hoặc **Copy**. Chọn datastore đích mà bạn muốn di chuyển máy ảo đến.

  ![Move Storage](https://github.com/cuongnvvietis/NhanHoa/blob/main/Docs/Esxi/Picture/Move%20Datastore/Screenshot_42.png)

5. **Xác Nhận Di Chuyển và theo dõi tiến trình hoàn thành**:
   - Xác nhận việc di chuyển hoặc sao chép các tệp của máy ảo sang datastore mới.

  ![Xac Nhan Storage](https://github.com/cuongnvvietis/NhanHoa/blob/main/Docs/Esxi/Picture/Move%20Datastore/Screenshot_43.png)

## Bước 4: Đăng Ký Lại Máy Ảo

1. **Truy Cập Datastore Mới**:
   - Quay lại tab **Storage** và chọn datastore mới nơi máy ảo đã được di chuyển.

2. **Đăng Ký Máy Ảo**:
   - Vào thư mục chứa máy ảo mới trên datastore, nhấp chuột phải vào tệp cấu hình máy ảo (`.vmx`) và chọn **Register VM**.

 ![Xac Nhan Storage](https://github.com/cuongnvvietis/NhanHoa/blob/main/Docs/Esxi/Picture/Move%20Datastore/Screenshot_44.png)

## Bước 5: Bật Máy Ảo

1. **Bật Máy Ảo**:
   - Quay lại tab **Virtual Machines**, chọn máy ảo đã di chuyển, nhấp chuột phải và chọn **Power** > **Power On** để bật máy ảo.
---

Với các bước trên, bạn đã hoàn thành việc di chuyển một máy ảo từ datastore này sang datastore khác trên cùng một ESXi host mà không cần sử dụng vCenter.
