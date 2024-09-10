# Phân Vùng Ổ Cứng và Logical Volume Manager (LVM)

Khi phân vùng ổ cứng, bạn có thể chọn giữa phân vùng truyền thống và quản lý lưu trữ linh hoạt (LVM). Dưới đây là so sánh giữa hai phương pháp này và lý do vì sao LVM có thể là lựa chọn tốt hơn.

## Phân Vùng Truyền Thống

### Loại Phân Vùng

- **Primary Partition**: Một ổ đĩa có thể chứa tối đa bốn phân vùng chính.
- **Extended Partition**: Cung cấp khả năng tạo nhiều phân vùng logic.
- **Logical Partition**: Các phân vùng logic nằm bên trong phân vùng mở rộng.

### Đặc Điểm

- **Mở Rộng Dung Lượng**: Cần phải xóa và tạo lại phân vùng mới.
- **Snapshot**: Không hỗ trợ.
- **Quản Lý Dung Lượng**: Cố định, không linh hoạt.
- **Thay Đổi Kích Thước**: Phải xóa và tạo lại phân vùng.
- **Hiệu Suất**: Không có tính năng tối ưu hóa hiệu suất.
- **Quản Lý**: Quản lý phân vùng cố định.

## Logical Volume Manager (LVM)

### Loại Phân Vùng

- **Physical Volume (PV)**: Các thiết bị lưu trữ vật lý được thêm vào LVM.
- **Volume Group (VG)**: Nhóm các PV lại với nhau để tạo một pool lưu trữ.
- **Logical Volume (LV)**: Các phân vùng logic trong VG.

### Đặc Điểm

- **Mở Rộng Dung Lượng**: Dễ dàng mở rộng hoặc thu hẹp kích thước Logical Volume mà không cần phải thay đổi cấu trúc phân vùng hoặc khởi động lại hệ thống.
- **Snapshot**: Cho phép tạo các bản sao (snapshot) của Logical Volume tại một thời điểm cụ thể.
- **Quản Lý Dung Lượng**: Hỗ trợ thin provisioning để cung cấp dung lượng khi cần thiết, giúp tiết kiệm không gian lưu trữ.
- **Thay Đổi Kích Thước**: Có thể thay đổi kích thước của các phân vùng mà không cần khởi động lại hệ thống.
- **Hiệu Suất**: Hỗ trợ striping và mirroring để cải thiện hiệu suất đọc/ghi và bảo vệ dữ liệu.
- **Quản Lý**: Quản lý linh hoạt với các volume group và logical volume.

## So Sánh

| Tính Năng                | Phân Vùng Truyền Thống               | LVM (Logical Volume Manager)                 |
|---------------------------|---------------------------------------|----------------------------------------------|
| **Mở Rộng Dung Lượng**    | Cần xóa và tạo lại phân vùng mới.     | Dễ dàng mở rộng hoặc thu hẹp kích thước.   |
| **Snapshot**              | Không hỗ trợ.                         | Hỗ trợ tạo snapshot của Logical Volume.     |
| **Quản Lý Dung Lượng**    | Cố định, không linh hoạt.             | Linh hoạt với thin provisioning.            |
| **Thay Đổi Kích Thước**   | Phải xóa và tạo lại phân vùng.         | Thay đổi kích thước mà không cần khởi động lại.|
| **Hiệu Suất**             | Không có tính năng tối ưu hóa hiệu suất. | Hỗ trợ striping và mirroring để cải thiện hiệu suất.|
| **Quản Lý**               | Quản lý phân vùng cố định.             | Quản lý linh hoạt với các volume group và logical volume.|

LVM cung cấp sự linh hoạt và khả năng mở rộng cao hơn so với phân vùng truyền thống, đặc biệt hữu ích trong các môi trường yêu cầu quản lý lưu trữ động và khả năng sao lưu linh hoạt.

---

Cập nhật và quản lý thông tin chi tiết về LVM và phân vùng trong [tài liệu](https://github.com/username/repository) của bạn.
