# Hướng Dẫn Di Chuyển (Migrate) Máy Ảo Giữa Các Host hoặc Datastore Trên VMware vCenter

Di chuyển máy ảo giữa các host ESXi hoặc datastore khác trên VMware vCenter có thể được thực hiện dễ dàng bằng cách sử dụng vMotion (di chuyển máy ảo giữa các host) hoặc Storage vMotion (di chuyển máy ảo giữa các datastore). Dưới đây là hướng dẫn từng bước để thực hiện việc này.

## Bước 1: Đăng Nhập vào vCenter

1. **Mở Trình Duyệt Web**:
   - Mở trình duyệt web và truy cập vào địa chỉ IP hoặc tên miền của vCenter Server.

2. **Đăng Nhập**:
   - Nhập tên người dùng và mật khẩu để đăng nhập vào giao diện vSphere Web Client.

## Bước 2: Chọn Máy Ảo

1. **Truy Cập Máy Ảo**:
   - Trong giao diện vSphere Web Client, chọn **VMs and Templates** từ menu bên trái.

2. **Chọn Máy Ảo**:
   - Tìm và chọn máy ảo mà bạn muốn di chuyển.

   ![Select VM](https://github.com/cuongnvvietis/NhanHoa/blob/main/Docs/Esxi/Picture/Move%20Datastore/Screenshot_45.png)

## Bước 3: Thực Hiện Di Chuyển

### Di Chuyển Máy Ảo Giữa Các Host (vMotion)

1. **Chọn "Migrate"**:
   - Nhấp chuột phải vào máy ảo và chọn **Migrate** từ menu ngữ cảnh.

   ![Migrate VM](https://github.com/cuongnvvietis/NhanHoa/blob/main/Docs/Esxi/Picture/Move%20Datastore/Screenshot_45.png)

2. **Chọn Loại Di Chuyển**:
   - Chọn **Change compute resource only** để di chuyển máy ảo giữa các host. Nhấp **Next**.

   ![Select Migrate Type](https://github.com/cuongnvvietis/NhanHoa/blob/main/Docs/Esxi/Picture/Move%20Datastore/Screenshot_46.png)

3. **Chọn Host Đích**:
   - Chọn host đích nơi bạn muốn di chuyển máy ảo đến. Nhấp **Next**.

   ![Select Destination Host](https://github.com/cuongnvvietis/NhanHoa/blob/main/Docs/Esxi/Picture/Move%20Datastore/Screenshot_47.png)

4. **Xem Lại và Hoàn Tất**:
   - Kiểm tra tất cả các thông tin đã chọn. Nhấp **Finish** để hoàn tất việc di chuyển.

   ![Review and Finish](https://github.com/cuongnvvietis/NhanHoa/blob/main/Docs/Esxi/Picture/Move%20Datastore/Screenshot_48.png)

### Di Chuyển Máy Ảo Giữa Các Datastore (Storage vMotion)

1. **Chọn "Migrate"**:
   - Nhấp chuột phải vào máy ảo và chọn **Migrate** từ menu ngữ cảnh.

   ![Migrate VM](https://github.com/cuongnvvietis/NhanHoa/blob/main/Docs/Esxi/Picture/Move%20Datastore/Screenshot_45.png)

2. **Chọn Loại Di Chuyển**:
   - Chọn **Change storage only** để di chuyển máy ảo giữa các datastore. Nhấp **Next**.

   ![Select Migrate Type](https://github.com/cuongnvvietis/NhanHoa/blob/main/Docs/Esxi/Picture/Move%20Datastore/Screenshot_46.png)

3. **Chọn Datastore Đích**:
   - Chọn datastore đích nơi bạn muốn di chuyển máy ảo đến. Nhấp **Next**.

   ![Select Destination Datastore](https://github.com/cuongnvvietis/NhanHoa/blob/main/Docs/Esxi/Picture/Move%20Datastore/Screenshot_47.png)

4. **Xem Lại và Hoàn Tất**:
   - Kiểm tra tất cả các thông tin đã chọn. Nhấp **Finish** để hoàn tất việc di chuyển.

   ![Review and Finish](https://github.com/cuongnvvietis/NhanHoa/blob/main/Docs/Esxi/Picture/Move%20Datastore/Screenshot_48.png)

---

Với các bước trên, bạn đã hoàn tất việc di chuyển máy ảo giữa các host hoặc datastore trên VMware ESXi thông qua vCenter.
