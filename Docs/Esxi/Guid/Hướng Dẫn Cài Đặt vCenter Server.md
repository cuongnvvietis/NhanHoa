# Hướng Dẫn Cài Đặt vCenter Server

## Mục Lục
1. [Yêu Cầu Hệ Thống](#yêu-cầu-hệ-thống)
2. [Chuẩn Bị Cài Đặt](#chuẩn-bị-cài-đặt)
3. [Tải và Mount File ISO](#tải-và-mount-file-iso)
4. [Cài Đặt vCenter Server - Giai Đoạn 1](#cài-đặt-vcenter-server---giai-đoạn-1)
5. [Cấu Hình vCenter Server - Giai Đoạn 2](#cấu-hình-vcenter-server---giai-đoạn-2)
6. [Kiểm Tra Kết Quả](#kiểm-tra-kết-quả)
7. [Lưu Ý](#lưu-ý)

---

## Yêu Cầu Hệ Thống

Trước khi cài đặt, hãy đảm bảo máy chủ của bạn đáp ứng các yêu cầu sau:
- **CPU:** Tối thiểu 2 CPU, 4 cores.
- **RAM:** Tối thiểu 12 GB RAM.
- **Dung Lượng Ổ Đĩa:** Tối thiểu 300 GB dung lượng đĩa trống.
- **ESXi Host:** vCenter yêu cầu một máy chủ ESXi để cài đặt. Bạn cần ESXi 6.5 trở lên.
- **DNS:** Đảm bảo cấu hình DNS chính xác và có thể phân giải tên vCenter Server.

## Chuẩn Bị Cài Đặt

1. **Download vCenter ISO:**
   - Truy cập trang chủ VMware và tải file ISO của vCenter Server về máy tính của bạn.

2. **Chuẩn Bị Tên và Địa Chỉ IP:**
   - Đặt trước hostname và địa chỉ IP cho vCenter Server.
   - Cấu hình DNS trên hệ thống của bạn để hostname và IP khớp nhau.

## Tải và Mount File ISO

1. **Mount File ISO:**
   - Trên máy tính cài đặt (Windows/Linux/Mac), sử dụng phần mềm mount file ISO (như Daemon Tools, PowerISO, hoặc sử dụng tính năng tích hợp trong hệ điều hành).
   - Sau khi mount, bạn sẽ thấy một thư mục ảo chứa các file cài đặt của vCenter.

2. **Chạy Trình Cài Đặt:**
   - Vào thư mục chứa file cài đặt và chạy file **`installer.exe`** (trên Windows) hoặc **`installer`** (trên Linux).
  
   ![Yêu cầu hệ thống](https://github.com/cuongnvvietis/NhanHoa/blob/main/Docs/Esxi/Picture/Vcenter/Screenshot_89.png)

## Cài Đặt vCenter Server - Giai Đoạn 1

1. **Bắt Đầu Quá Trình Cài Đặt:**
   - Chọn **Install** để bắt đầu cài đặt vCenter Server.
  
   ![Yêu cầu hệ thống](https://github.com/cuongnvvietis/NhanHoa/blob/main/Docs/Esxi/Picture/Vcenter/Screenshot_90.png)

2. **Chọn Địa Chỉ Triển Khai:**
   - Điền địa chỉ IP của máy chủ ESXi mà bạn sẽ cài đặt vCenter Server lên.
   - Cung cấp thông tin xác thực của ESXi host để tiếp tục.
  
    ![Yêu cầu hệ thống](https://github.com/cuongnvvietis/NhanHoa/blob/main/Docs/Esxi/Picture/Vcenter/Screenshot_92.png)

3. **Cấu Hình Thông Tin vCenter:**
   - Đặt tên cho vCenter Server và địa chỉ IP đã chuẩn bị trước.
   - Đảm bảo DNS và IP có thể phân giải lẫn nhau.
  
   ![Yêu cầu hệ thống](https://github.com/cuongnvvietis/NhanHoa/blob/main/Docs/Esxi/Picture/Vcenter/Screenshot_94.png)

4. **Chọn Kích Thước Cấu Hình:**
   - Chọn cấu hình kích thước cho vCenter (Tiny, Small, Medium, Large) dựa trên nhu cầu của hệ thống.
   
5. **Chọn Storage:**
   - Chọn datastore trên ESXi host để lưu trữ vCenter Server.

6. **Mạng và IP:**
   - Cấu hình mạng cho vCenter Server (chọn đúng VLAN hoặc port group trên ESXi).

7. **Bắt Đầu Triển Khai:**
   - Nhấn **Next** và bắt đầu quá trình triển khai giai đoạn 1. Điều này sẽ tạo máy ảo vCenter Server trên ESXi host.

## Cấu Hình vCenter Server - Giai Đoạn 2

1. **Bắt Đầu Cấu Hình:**
   - Sau khi hoàn thành giai đoạn 1, vCenter sẽ yêu cầu bạn tiếp tục cấu hình ở giai đoạn 2.
   - Nhấn **Continue** để bắt đầu.

2. **Thiết Lập Mật Khẩu Root:**
   - Đặt mật khẩu cho user `root` của vCenter Server.

3. **Cấu Hình NTP và Time Zone:**
   - Chọn múi giờ phù hợp và cấu hình NTP server để đồng bộ thời gian chính xác.

4. **Bật hoặc Tắt CEIP:**
   - Chọn tham gia hoặc không tham gia chương trình Customer Experience Improvement Program (CEIP).

5. **Bắt Đầu Cấu Hình:**
   - Nhấn **Finish** để hoàn tất quá trình cài đặt.

## Kiểm Tra Kết Quả

1. **Truy Cập vCenter Web Client:**
   - Sau khi quá trình cấu hình hoàn thành, truy cập vCenter qua giao diện web bằng cách nhập địa chỉ IP hoặc FQDN của vCenter vào trình duyệt:
     ```
     https://<vcenter-ip-or-fqdn>/ui
     ```
   - Đăng nhập bằng tài khoản `administrator@vsphere.local` và mật khẩu đã thiết lập.

2. **Kiểm Tra Trạng Thái Dịch Vụ:**
   - Vào mục **System Configuration** và kiểm tra các dịch vụ của vCenter đang hoạt động.

## Lưu Ý

- **Cấu Hình Backup:** Sau khi cài đặt, hãy thiết lập backup thường xuyên cho vCenter Server.
- **Khuyến Nghị Sử Dụng NTP:** Luôn cấu hình NTP cho ESXi host và vCenter để tránh các vấn đề liên quan đến thời gian không chính xác.
- **Giám Sát Hiệu Suất:** Theo dõi và quản lý tài nguyên để đảm bảo vCenter Server hoạt động ổn định.
