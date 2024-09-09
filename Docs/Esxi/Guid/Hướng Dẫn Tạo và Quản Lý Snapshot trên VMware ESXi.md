# Hướng Dẫn Tạo và Quản Lý Snapshot trên VMware ESXi

Snapshot là một công cụ quan trọng giúp bạn lưu lại trạng thái hiện tại của máy ảo, cho phép khôi phục lại trạng thái đó nếu cần thiết. Dưới đây là hướng dẫn từng bước để tạo và quản lý snapshot của một máy ảo trên VMware ESXi.

## Bước 1: Đăng Nhập vào VMware ESXi

1. **Mở Trình Duyệt Web**:
   - Mở trình duyệt web và truy cập vào địa chỉ của ESXi host.

2. **Đăng Nhập**:
   - Nhập tên người dùng và mật khẩu để đăng nhập vào giao diện web của ESXi.

## Bước 2: Chọn Máy Ảo

1. **Vào Tab Virtual Machines**:
   - Trong giao diện chính của ESXi, chọn tab **Virtual Machines**.

2. **Chọn Máy Ảo**:
   - Tìm và chọn máy ảo mà bạn muốn tạo snapshot.

   ![Select VM](https://github.com/cuongnvvietis/NhanHoa/blob/main/Docs/Esxi/Picture/Snapshot/Screenshot_02.png)

## Bước 3: Tạo Snapshot

1. **Chọn Tạo Snapshot**:
   - Nhấp chuột phải vào máy ảo đã chọn và chọn **Snapshots** > **Take Snapshot**.

   ![Take Snapshot](https://github.com/cuongnvvietis/NhanHoa/blob/main/Docs/Esxi/Picture/Snapshot/Screenshot_39.png)

2. **Cung Cấp Thông Tin Snapshot**:
   - Nhập tên cho snapshot và mô tả nếu cần thiết. Chọn các tùy chọn bổ sung như **Snapshot the virtual machine’s memory** và **Quiesce guest file system** nếu cần.

   ![Snapshot Details](https://github.com/cuongnvvietis/NhanHoa/blob/main/Docs/Esxi/Picture/Snapshot/Screenshot_40.png)

3. **Xác Nhận Tạo Snapshot**:
   - Nhấp vào **OK** để bắt đầu quá trình tạo snapshot.

## Bước 4: Quản Lý Snapshot

1. **Xem Danh Sách Snapshot**:
   - Để xem các snapshot đã tạo, nhấp chuột phải vào máy ảo và chọn **Snapshots** > **Manage Snapshots**.

   ![Manage Snapshots](https://github.com/cuongnvvietis/NhanHoa/blob/main/Docs/Esxi/Picture/Snapshot/Screenshot_41.png)

2. **Khôi Phục hoặc Xóa Snapshot**:
   - Trong giao diện quản lý snapshot, bạn có thể chọn để khôi phục (revert to) hoặc xóa (delete) snapshot. Chọn snapshot cần khôi phục hoặc xóa, sau đó nhấp vào **Revert** hoặc **Delete**.

## Bước 5: Xác Nhận và Kiểm Tra

1. **Xác Nhận Trạng Thái**:
   - Kiểm tra trạng thái của máy ảo sau khi khôi phục hoặc xóa snapshot để đảm bảo rằng các thao tác đã thực hiện thành công.
