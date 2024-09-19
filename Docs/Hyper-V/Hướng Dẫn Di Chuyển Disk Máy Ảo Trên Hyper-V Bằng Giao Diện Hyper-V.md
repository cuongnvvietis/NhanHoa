# Hướng Dẫn Di Chuyển Máy Ảo Trên Hyper-V Bằng Giao Diện Hyper-V Manager

## Di Chuyển Máy Ảo Giữa Các Datastore

### **1. Mở Hyper-V Manager**

- Khởi động **Hyper-V Manager** trên máy chủ Hyper-V của bạn.

### **2. Chọn Máy Ảo**

- Trong **Hyper-V Manager**, chọn máy ảo mà bạn muốn di chuyển.

### **3. Truy Cập Chế Độ Di Chuyển Máy Ảo**

- Nhấp chuột phải vào máy ảo và chọn **Move** để mở **Move Virtual Machine Wizard**.

### **4. Chọn Loại Di Chuyển**

- Trong cửa sổ **Move Virtual Machine Wizard**, bạn có hai tùy chọn chính:

  - **Move the virtual machine**: Di chuyển toàn bộ máy ảo, bao gồm cả các file cấu hình và ổ đĩa cứng ảo.
  - **Move the virtual machine's storage**: Chỉ di chuyển các ổ đĩa cứng ảo của máy ảo.

  Chọn tùy chọn phù hợp và nhấp **Next**.
  
![Command Prompt](https://github.com/cuongnvvietis/NhanHoa/blob/main/Docs/Picture/Hyper-v/Screenshot_45.png)

### **5. Chọn Loại Di Chuyển Cụ Thể**

Sau khi chọn loại di chuyển, bạn sẽ thấy ba tùy chọn cụ thể hơn:

#### **Nếu Chọn "Move the virtual machine"**

- **Move the virtual machine's data**: Di chuyển toàn bộ máy ảo, bao gồm cả file cấu hình và tất cả các ổ đĩa cứng ảo, đến một máy chủ hoặc datastore mới.
  - **Destination Host**: Chọn máy chủ Hyper-V đích nơi máy ảo sẽ được di chuyển đến.
  - **Destination Storage**: Chọn datastore đích cho các ổ đĩa cứng ảo trên máy chủ đích.

- **Move the virtual machine's configuration**: Di chuyển các file cấu hình của máy ảo đến một máy chủ hoặc datastore mới, nhưng giữ nguyên các ổ đĩa cứng ảo tại vị trí cũ.
  - **Destination Host**: Chọn máy chủ Hyper-V đích.
  - **Configuration Storage Location**: Chọn datastore mới cho các file cấu hình.

- **Move the virtual machine's storage**: Chỉ di chuyển các ổ đĩa cứng ảo của máy ảo đến một datastore mới, nhưng giữ nguyên các file cấu hình của máy ảo tại vị trí cũ.
  - **Destination Storage**: Chọn datastore đích cho các ổ đĩa cứng ảo.

  Nhấp **Next** sau khi chọn tùy chọn phù hợp.

![Command Prompt](https://github.com/cuongnvvietis/NhanHoa/blob/main/Docs/Picture/Hyper-v/Screenshot_47.png)
![Command Prompt](https://github.com/cuongnvvietis/NhanHoa/blob/main/Docs/Picture/Hyper-v/Screenshot_46.png)

### **6. Xác Nhận Di Chuyển**

- Xem lại các lựa chọn đã chọn và nhấp **Finish** để bắt đầu quá trình di chuyển.

### **7. Theo Dõi Quá Trình Di Chuyển**

- Theo dõi tiến trình di chuyển trong Hyper-V Manager. Thời gian hoàn tất sẽ phụ thuộc vào kích thước của máy ảo và tốc độ của hệ thống.

### **8. Kiểm Tra Máy Ảo Sau Khi Di Chuyển**

- Sau khi quá trình di chuyển hoàn tất, kiểm tra máy ảo tại datastore hoặc máy chủ đích để đảm bảo rằng nó đã được nhận diện đúng cách và hoạt động bình thường. Khởi động máy ảo nếu cần để kiểm tra hoạt động.

