# Hướng Dẫn Di Chuyển Máy Ảo Giữa Các Datastore Trên Cùng Một Host Trên VMware vCenter

Di chuyển máy ảo giữa các datastore trên cùng một host ESXi có thể được thực hiện bằng cách sử dụng Storage vMotion. Hướng dẫn dưới đây sẽ giúp bạn thực hiện việc này thông qua giao diện vSphere Web Client.

## Bước 1: Xác Định Datastore Hiện Tại của Máy Ảo

1. **Truy Cập Máy Ảo**:
   - Trong giao diện vSphere Web Client, chọn **VMs and Templates** từ menu bên trái.

2. **Chọn Máy Ảo**:
   - Tìm và chọn máy ảo mà bạn muốn kiểm tra.

3. **Kiểm Tra Datastore**:
   - Nhấp vào tab **Summary** của máy ảo và kiểm tra thông tin lưu trữ hiện tại. Bạn sẽ thấy các datastore đang chứa các đĩa ảo của máy ảo này.

   ![Xem Thông Tin Datastore](https://github.com/cuongnvvietis/NhanHoa/blob/main/Docs/Esxi/Picture/Move%20Datastore/Screenshot_49.png)

## Bước 2: Đăng Nhập vào vCenter

1. **Mở Trình Duyệt Web**:
   - Mở trình duyệt web và truy cập vào địa chỉ IP hoặc tên miền của vCenter Server.

2. **Đăng Nhập**:
   - Nhập tên người dùng và mật khẩu để đăng nhập vào giao diện vSphere Web Client.

## Bước 3: Thực Hiện Di Chuyển

1. **Chọn "Migrate"**:
   - Nhấp chuột phải vào máy ảo và chọn **Migrate** từ menu ngữ cảnh.

   ![Chọn Migrate](https://github.com/cuongnvvietis/NhanHoa/blob/main/Docs/Esxi/Picture/Move%20Datastore/Screenshot_50.png)

2. **Chọn Loại Di Chuyển**:
   - Chọn **Change storage only** để di chuyển máy ảo giữa các datastore. Nhấp **Next**.

   ![Chọn Loại Di Chuyển](https://github.com/cuongnvvietis/NhanHoa/blob/main/Docs/Esxi/Picture/Move%20Datastore/Screenshot_51.png)

3. **Chọn Datastore Đích**:
   - Chọn datastore đích nơi bạn muốn di chuyển máy ảo đến. Nhấp **Next**.

   ![Chọn Datastore Đích](https://github.com/cuongnvvietis/NhanHoa/blob/main/Docs/Esxi/Picture/Move%20Datastore/Screenshot_52.png)

4. **Xem Lại và Hoàn Tất**:
   - Kiểm tra tất cả các thông tin đã chọn. Nhấp **Finish** để hoàn tất việc di chuyển.

   ![Xem Lại và Hoàn Tất](https://github.com/cuongnvvietis/NhanHoa/blob/main/Docs/Esxi/Picture/Move%20Datastore/Screenshot_53.png)

---

Với các bước trên, bạn đã hoàn tất việc di chuyển máy ảo giữa các datastore trên cùng một host ESXi thông qua vCenter.
