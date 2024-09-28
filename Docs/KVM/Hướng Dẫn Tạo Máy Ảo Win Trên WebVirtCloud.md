# Hướng Dẫn Tạo Máy Ảo Win Trên WebVirtCloud

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

## Bước 5: Mount ISO để Cài Hệ Điều Hành
- Sau khi tạo xong máy ảo, chọn máy ảo và nhấn vào mục **Settings**.
- Chuyển sang tab **Disk**, tại **Instance Media**, chọn file ISO để cài đặt hệ điều hành (ví dụ: `AlmaLinux-8.9-x86_64-minimal.iso`).
- Nhấn **Mount** để gắn ISO vào máy ảo.

![Mount ISO để cài hệ điều hành](https://github.com/cuongnvvietis/NhanHoa/blob/main/Docs/Picture/KVM/Screenshot_34.png)

---

### Chú ý
- Bạn cần đảm bảo rằng tất cả các thành phần mạng, bộ nhớ, và lưu trữ đã được cấu hình đúng để máy ảo hoạt động ổn định.
- Đảm bảo rằng bạn đã chọn đúng **ISO** phù hợp với hệ điều hành mà bạn muốn cài đặt.

