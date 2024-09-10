# Hướng Dẫn Di Chuyển Máy Ảo Giữa Các Host ESXi Bằng vCenter

Di chuyển máy ảo giữa các host ESXi bằng vCenter có thể được thực hiện dễ dàng thông qua tính năng vMotion. Dưới đây là hướng dẫn từng bước để thực hiện việc này, bao gồm cả việc bật vMotion và xử lý CD/DVD drive trước khi di chuyển.

## Phần I: Bật vMotion

### Bước 1: Cấu Hình vMotion

1. **Đăng Nhập vào vCenter**:
   - Mở trình duyệt web và truy cập vào địa chỉ IP hoặc tên miền của vCenter Server.
   - Đăng nhập vào giao diện vSphere Web Client với tên người dùng và mật khẩu của bạn.

2. **Chọn Host**:
   - Trong giao diện vSphere Web Client, chọn **Hosts and Clusters** từ menu bên trái.
   - Chọn host mà bạn muốn cấu hình vMotion.

3. **Cấu Hình Network**:
   - Vào **Configure** > **Networking** > **VMkernel NIC s**.
   - Chọn **vmk0** và chọn Edit Setting
   - Chọn **vMotion**
   - Nhấp **Finish** để hoàn tất việc cấu hình.

   ![Vmotion](https://github.com/cuongnvvietis/NhanHoa/blob/main/Docs/Esxi/Picture/Move%20Datastore/Screenshot_54.png)

   ![Vmotion](https://github.com/cuongnvvietis/NhanHoa/blob/main/Docs/Esxi/Picture/Move%20Datastore/Screenshot_55.png)

5. **Lặp Lại Trên Host Khác**:
   - Lặp lại các bước trên để cấu hình vMotion cho các host còn lại.

## Phần II: Di Chuyển Máy Ảo Giữa Các Host

### Bước 1: Xử Lý CD/DVD Drive

1. **Ngắt Kết Nối CD/DVD Drive**:
   - Trước khi di chuyển máy ảo, bạn cần đảm bảo CD/DVD drive không bị khóa hoặc không sử dụng bởi máy ảo.
   - Trong giao diện vSphere Web Client, chọn máy ảo và vào **Edit Settings**.
   - Chọn CD/DVD drive và thay đổi trạng thái của nó từ "Connected" sang "Disconnected".
   - Nhấp **OK** để lưu thay đổi.

   ![Disconnect CD/DVD Drive](https://github.com/cuongnvvietis/NhanHoa/blob/main/Docs/Esxi/Picture/Move%20Datastore/Screenshot_63.png)

### Bước 2: Chọn Máy Ảo

1. **Truy Cập Máy Ảo**:
   - Trong giao diện vSphere Web Client, chọn **VMs and Templates** từ menu bên trái.
   - Tìm và chọn máy ảo mà bạn muốn di chuyển.

### Bước 3: Thực Hiện Di Chuyển

1. **Chọn "Migrate"**:
   - Nhấp chuột phải vào máy ảo và chọn **Migrate** từ menu ngữ cảnh.

   ![Migrate VM](https://github.com/cuongnvvietis/NhanHoa/blob/main/Docs/Esxi/Picture/Move%20Datastore/Screenshot_56.png)

2. **Chọn Loại Di Chuyển**:
   - Chọn loại di chuyển phù hợp với yêu cầu của bạn:
     - **Change compute resource only**: Di chuyển máy ảo giữa các host.
     - **Change storage only**: Di chuyển máy ảo giữa các datastore.
     - **Change both compute resource and storage**: Di chuyển máy ảo giữa các host và datastore.
   - Nhấp **Next**.

   ![Select Migration Type](https://github.com/cuongnvvietis/NhanHoa/blob/main/Docs/Esxi/Picture/Move%20Datastore/Screenshot_57.png)

3. **Chọn Tài Nguyên Tính Toán (Compute Resource)**:
   - Chọn host hoặc cluster nơi bạn muốn di chuyển máy ảo đến. Nhấp **Next**.

   ![Select Compute Resource](https://github.com/cuongnvvietis/NhanHoa/blob/main/Docs/Esxi/Picture/Move%20Datastore/Screenshot_58.png)

4. **Chọn Lưu Trữ (Storage)**:
   - Nếu bạn đang thay đổi datastore, chọn datastore đích nơi bạn muốn di chuyển máy ảo đến. Nhấp **Next**.

   ![Select Storage](https://github.com/cuongnvvietis/NhanHoa/blob/main/Docs/Esxi/Picture/Move%20Datastore/Screenshot_59.png)

5. **Cấu Hình Mạng (Network)**:
   - Nếu cần, cấu hình các thiết lập mạng cho máy ảo. Nhấp **Next**.

   ![Select Network](https://github.com/cuongnvvietis/NhanHoa/blob/main/Docs/Esxi/Picture/Move%20Datastore/Screenshot_60.png)

6. **Chọn Ưu Tiên vMotion**:
   - Chọn mức độ ưu tiên vMotion cho việc di chuyển máy ảo, như **High**, **Medium**, hoặc **Low**. Nhấp **Next**.

   ![Select vMotion Priority](https://github.com/cuongnvvietis/NhanHoa/blob/main/Docs/Esxi/Picture/Move%20Datastore/Screenshot_61.png)

7. **Xem Lại và Hoàn Tất**:
   - Kiểm tra tất cả các thông tin đã chọn. Nhấp **Finish** để hoàn tất việc di chuyển.

   ![Review and Finish](https://github.com/cuongnvvietis/NhanHoa/blob/main/Docs/Esxi/Picture/Move%20Datastore/Screenshot_62.png)
