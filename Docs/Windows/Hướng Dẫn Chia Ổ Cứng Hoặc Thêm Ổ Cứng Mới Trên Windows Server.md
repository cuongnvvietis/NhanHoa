# Hướng Dẫn Chia Ổ Cứng Hoặc Thêm Ổ Cứng Mới Trên Windows Server

## 1. Chia Ổ Cứng Đã Có

### **a. Mở Disk Management**

1. Nhấn `Windows Key + X` hoặc chuột phải vào nút `Start` (Bắt đầu).
2. Chọn `Disk Management` (Quản lý Đĩa) từ menu.

![Command Prompt](https://github.com/cuongnvvietis/NhanHoa/blob/main/Docs/Esxi/Picture/Disk/Screenshot_129.png)
### **b. Rút Ngắn Phân Vùng Hiện Tại**

1. Trong Disk Management, nhấn chuột phải vào phân vùng bạn muốn rút ngắn (ví dụ: ổ đĩa E:).
2. Chọn `Shrink Volume` (Rút ngắn phân vùng).
3. Nhập kích thước mà bạn muốn giảm phân vùng (ví dụ: giảm 10 GB).
4. Nhấn `Shrink` (Rút ngắn) để hoàn tất. Phần không gian vừa được rút ngắn sẽ xuất hiện dưới dạng "Unallocated" (Chưa phân bổ).
![Command Prompt](https://github.com/cuongnvvietis/NhanHoa/blob/main/Docs/Esxi/Picture/Disk/Screenshot_123.png)

### **c. Tạo Phân Vùng Mới**

1. Nhấn chuột phải vào không gian chưa phân bổ (Unallocated).
2. Chọn `New Simple Volume` (Tạo phân vùng đơn giản).
3. Làm theo hướng dẫn trong wizard:
   - Chọn kích thước phân vùng.
   - Chọn ký tự ổ đĩa hoặc để hệ thống tự động chọn.
   - Chọn định dạng hệ thống tệp (NTFS hoặc ReFS).
   - Đặt tên cho phân vùng nếu cần.
4. Nhấn `Finish` (Hoàn tất) để tạo phân vùng mới.
![Command Prompt](https://github.com/cuongnvvietis/NhanHoa/blob/main/Docs/Esxi/Picture/Disk/Screenshot_128.png)

## 2. Thêm Ổ Cứng Mới

### **a. Kết Nối Ổ Cứng Mới**

1. **Đối với phần cứng:** 
   - Đảm bảo rằng ổ cứng mới đã được kết nối vật lý vào máy chủ.

2. **Đối với máy ảo:** 
   - Mở máy ảo và thêm ổ đĩa mới qua các cài đặt của máy ảo trong phần mềm ảo hóa (như Hyper-V hoặc VMware).

### **b. Mở Disk Management**

1. Nhấn `Windows Key + X` hoặc chuột phải vào nút `Start` (Bắt đầu).
2. Chọn `Disk Management` (Quản lý Đĩa) từ menu.

### **c. Khởi Tạo Ổ Cứng Mới**

1. Trong Disk Management, bạn sẽ thấy ổ cứng mới xuất hiện dưới dạng "Unknown" (Chưa xác định) và "Not Initialized" (Chưa khởi tạo).
2. Nhấn chuột phải vào ổ đĩa mới và chọn `Initialize Disk` (Khởi tạo đĩa).
3. Chọn kiểu phân vùng (MBR hoặc GPT). Nếu không chắc chắn, chọn GPT cho các ổ đĩa lớn hơn 2TB hoặc MBR nếu ổ đĩa nhỏ hơn.
4. Nhấn `OK` để hoàn tất khởi tạo.

![Command Prompt](https://github.com/cuongnvvietis/NhanHoa/blob/main/Docs/Esxi/Picture/Disk/Screenshot_126.png)

### **d. Tạo Phân Vùng Mới**

1. Nhấn chuột phải vào không gian chưa phân bổ (Unallocated) trên ổ cứng mới.
2. Chọn `New Simple Volume` (Tạo phân vùng đơn giản).
3. Làm theo hướng dẫn trong wizard:
   - Chọn kích thước phân vùng.
   - Chọn ký tự ổ đĩa hoặc để hệ thống tự động chọn.
   - Chọn định dạng hệ thống tệp (NTFS hoặc ReFS).
   - Đặt tên cho phân vùng nếu cần.
4. Nhấn `Finish` (Hoàn tất) để tạo phân vùng mới.

![Command Prompt](https://github.com/cuongnvvietis/NhanHoa/blob/main/Docs/Esxi/Picture/Disk/Screenshot_128.png)

## 3. Định Dạng và Sử Dụng Phân Vùng Mới

- Sau khi tạo phân vùng mới, nó sẽ xuất hiện trong Windows Explorer với ký tự ổ đĩa đã chọn. Bạn có thể bắt đầu sử dụng nó như một ổ đĩa bình thường.

