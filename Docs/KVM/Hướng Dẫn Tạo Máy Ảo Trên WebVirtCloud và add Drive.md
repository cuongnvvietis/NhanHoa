# Hướng Dẫn Tạo Máy Ảo Win Trên WebVirtCloud và add drive card mạng cũng như ổ cứng

## Bước 1: Chọn Compute cho Máy Ảo Mới
- Truy cập vào WebVirtCloud và chọn mục **Create New Instance**.
- Một cửa sổ hiện ra, bạn chọn **Compute** mà máy ảo sẽ chạy trên đó.
- Nhấn vào biểu tượng dấu cộng (+) hoặc chọn nút **Choose** để tiếp tục.

![Chọn Compute cho máy ảo mới](https://github.com/cuongnvvietis/NhanHoa/blob/main/Docs/Picture/KVM/Screenshot_30.png)

## Bước 2: Chọn Kiến Trúc và Chipset
- Ở cửa sổ **New instance on KVM**, chọn mục **Architecture** để định cấu hình cho máy ảo.
- Ở đây bạn có thể chọn **Kiến trúc (Architecture)** như `x86_64` và **Chipset** như `q35`.
- Sau khi chọn xong, nhấn **Next** để tiếp tục.

![Chọn Architecture và Chipset](https://github.com/cuongnvvietis/NhanHoa/blob/main/Docs/Picture/KVM/Screenshot_31.png)

## Bước 3: Chọn Flavor cho Máy Ảo
- Trong bước này, bạn có thể chọn cấu hình sẵn cho máy ảo (gọi là **Flavor**).
- Ví dụ, bạn có thể chọn **medium** với cấu hình 2 CPU, 4096 MB RAM và 60 GB HDD.
- Nhấn vào biểu tượng dấu cộng (+) để chọn flavor này.

![Chọn Flavor cho máy ảo](https://github.com/cuongnvvietis/NhanHoa/blob/main/Docs/Picture/KVM/Screenshot_32.png)

## Bước 4: Cấu Hình Chi Tiết Máy Ảo
- Cửa sổ **Create Virtual Machine** hiện ra, tại đây bạn cần cấu hình chi tiết cho máy ảo.
  - **Name**: Tên máy ảo (ví dụ: `windows 10`).
  - **Firmware**: Lựa chọn firmware (ví dụ: `BIOS`).
  - **VCPU Config**: Lựa chọn cấu hình CPU (ví dụ: `host-model`).
  - **Storage**: Chọn kho lưu trữ hình ảnh (ví dụ: `images`).
  - **Network**: Chọn mạng mà máy ảo sẽ sử dụng (ví dụ: `NATtest`).
- Nhấn **Create** để tạo máy ảo.

![Cấu hình chi tiết máy ảo](https://github.com/cuongnvvietis/NhanHoa/blob/main/Docs/Picture/KVM/Screenshot_33.png)

### Bước 5: Cài Đặt Windows và Tải Driver Ổ Cứng
1. Khởi động máy ảo từ file **ISO cài đặt Windows**.
2. Khi đến bước **Where do you want to install Windows?**, bạn sẽ thấy thông báo rằng **không có ổ đĩa nào được tìm thấy**. Để khắc phục, nhấn vào nút **Load driver**.

![Không Thấy Ổ Cứng](https://github.com/cuongnvvietis/NhanHoa/blob/main/Docs/Picture/KVM/Screenshot_37.png)

3. Sau đó, chọn **Browse** và duyệt đến **CD-ROM 2** (chứa ISO VirtIO).
   - Vào thư mục `viostor` và chọn phiên bản phù hợp với Windows (ví dụ: `2k22` cho Windows Server 2022 hoặc `amd64` cho Windows 11 64-bit).
   
![Chọn Driver VirtIO](https://github.com/cuongnvvietis/NhanHoa/blob/main/Docs/Picture/KVM/Screenshot_38.png)

4. Nhấn **OK** và chọn **Next** để cài đặt driver VirtIO cho ổ cứng.
5. Sau khi driver được cài đặt, bạn sẽ thấy ổ cứng xuất hiện và có thể chọn để cài đặt Windows.

![Ổ Cứng Đã Xuất Hiện](https://github.com/cuongnvvietis/NhanHoa/blob/main/Docs/Picture/KVM/Screenshot_39.png)

### Bước 5: Cài Đặt Driver Card Mạng Sau Khi Windows Đã Cài Đặt
1. Sau khi Windows được cài đặt xong, bạn sẽ cần cài đặt driver cho card mạng.
2. Mở **Device Manager** và bạn sẽ thấy thiết bị mạng chưa nhận diện (có dấu chấm than màu vàng).
3. Gắn lại **ISO VirtIO** nếu cần thiết, sau đó nhấn chuột phải vào thiết bị mạng và chọn **Update driver**.
4. Chọn **Browse my computer for drivers** và duyệt đến thư mục `NetKVM` trên ISO VirtIO.
   - Chọn phiên bản phù hợp với Windows (ví dụ: `amd64`).

![Chọn Driver Card Mạng](https://github.com/cuongnvvietis/NhanHoa/blob/main/Docs/Picture/KVM/Screenshot_40.png)

5. Nhấn **OK** và **Next** để cài đặt driver mạng. Sau khi cài đặt, thiết bị mạng sẽ hoạt động bình thường và bạn sẽ có kết nối mạng.



