# Hướng Dẫn Cấu Hình Mạng Dạng Flat Trên Hyper-V

Cấu hình mạng dạng flat trên Hyper-V cho phép tất cả các máy ảo nằm trong cùng một subnet và giao tiếp trực tiếp với nhau mà không cần phân chia VLAN hoặc các cấu hình mạng phức tạp khác.

## 1. Tạo Virtual Switch (Switch Ảo)

1. **Mở Hyper-V Manager:**
   - Mở **Hyper-V Manager** từ menu Start hoặc tìm kiếm trong Windows.

2. **Truy Cập Virtual Switch Manager:**
   - Trong Hyper-V Manager, chọn **Virtual Switch Manager** từ menu bên trái.

3. **Tạo Virtual Switch Mới:**
   - Chọn **New virtual network switch**.
   - Chọn loại switch là **External** để cho phép máy ảo giao tiếp với mạng bên ngoài.
   - Nhấp **Create Virtual Switch**.

 ![Cấu Hình Virtual Switch](https://github.com/cuongnvvietis/NhanHoa/blob/main/Docs/Picture/Hyper-v/Screenshot_7.png)
 
4. **Cấu Hình Virtual Switch:**
   - Đặt tên cho switch (ví dụ: `FlatNetworkSwitch`).
   - Trong phần **Connection type**, chọn **External network** và chọn card mạng vật lý mà bạn muốn sử dụng.
   - Đảm bảo rằng **Allow management operating system to share this network adapter** được chọn nếu bạn muốn hệ điều hành chính (host) sử dụng cùng card mạng.
   - Nhấp **OK** để lưu cấu hình và tạo switch.

   ![Cấu Hình Virtual Switch](https://github.com/cuongnvvietis/NhanHoa/blob/main/Docs/Picture/Hyper-v/Screenshot_8.png)

