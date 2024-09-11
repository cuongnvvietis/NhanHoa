# Hướng Dẫn Cài Đặt Veeam Backup & Replication

## Mục Lục
1. [Yêu Cầu Hệ Thống](#yêu-cầu-hệ-thống)
2. [Chuẩn Bị](#chuẩn-bị)
3. [Tải Về và Cài Đặt](#tải-về-và-cài-đặt)
4. [Cấu Hình Ban Đầu](#cấu-hình-ban-đầu)
5. [Thêm Máy Chủ ESXi](#thêm-máy-chủ-esxi)
6. [Thiết Lập Job Sao Lưu](#thiết-lập-job-sao-lưu)

---

## Yêu Cầu Hệ Thống

### Phần Cứng
- **CPU:** Tối thiểu 2-core, khuyến nghị 4-core
- **RAM:** Tối thiểu 4 GB, khuyến nghị 8 GB
- **Dung Lượng Ổ Đĩa:** Tối thiểu 500 GB trống cho việc lưu trữ sao lưu
- **Kết Nối Mạng:** 1 Gbps hoặc nhanh hơn

### Phần Mềm
- **Hệ Điều Hành:** Windows Server 2016/2019/2022
- **Phiên Bản SQL Server:** SQL Server Express sẽ được cài đặt tự động nếu chưa có.

## Chuẩn Bị

1. **Máy Chủ Cài Đặt:**
   - Chuẩn bị một máy chủ Windows với hệ điều hành được hỗ trợ.
   - Kiểm tra xem máy chủ có đủ tài nguyên phần cứng để chạy Veeam Backup & Replication.

2. **Tài Khoản Quản Trị:**
   - Đảm bảo bạn có tài khoản với quyền quản trị trên máy chủ Windows nơi Veeam sẽ được cài đặt.

3. **Kết Nối Mạng:**
   - Đảm bảo máy chủ có thể kết nối đến các máy chủ ESXi hoặc hạ tầng ảo hóa khác mà bạn muốn sao lưu.

## Tải Về và Cài Đặt

1. **Tải Về Veeam Backup & Replication:**
   - Truy cập vào [trang chủ Veeam](https://www.veeam.com/backup-replication-download.html) và tải về phiên bản Veeam Backup & Replication.

2. **Chạy Trình Cài Đặt:**
   - Chạy file cài đặt `.exe` và làm theo hướng dẫn trên màn hình.

3. **Chọn Các Thành Phần Cần Cài Đặt:**
   - Chọn các thành phần sau trong quá trình cài đặt:
     - **Veeam Backup Server**
     - **Veeam Backup Console**
     - **Veeam Backup Catalog**
     - **Veeam Backup & Replication PowerShell module** (tuỳ chọn)

  ![Hình ảnh quá trình cài đặt Veeam](https://github.com/cuongnvvietis/NhanHoa/blob/main/Docs/Esxi/Picture/Veem/Screenshot_74.png)

4. **Cài Đặt SQL Server Express (Nếu Cần):**
   - Nếu không có SQL Server trên máy chủ, Veeam sẽ tự động cài đặt SQL Server Express.

  ![Hình ảnh quá trình cài đặt Veeam](https://github.com/cuongnvvietis/NhanHoa/blob/main/Docs/Esxi/Picture/Veem/Screenshot_77.png)

5. **Hoàn Thành Cài Đặt:**
   - Sau khi cài đặt xong, khởi động lại máy chủ nếu được yêu cầu.

## Cấu Hình Ban Đầu

1. **Khởi Động Veeam Backup & Replication:**
   - Sau khi cài đặt, mở **Veeam Backup & Replication Console** từ máy chủ.

2. **Cấu Hình Repository (Kho Lưu Trữ):**
   - Từ giao diện, vào **Backup Infrastructure** > **Backup Repositories**.
   - Thêm hoặc cấu hình một repository mới để lưu trữ bản sao lưu. Bạn có thể chọn ổ đĩa cục bộ hoặc ổ đĩa mạng.

  ![Hình ảnh thêm máy chủ ESXi](https://github.com/cuongnvvietis/NhanHoa/blob/main/Docs/Esxi/Picture/Veem/Screenshot_81.png)

## Thêm Máy Chủ ESXi

1. **Thêm Máy Chủ ESXi:**
   - Trong Veeam Console, vào **Backup Infrastructure** > **Managed Servers**.
   - Chọn **Add Server** và thêm thông tin đăng nhập cho máy chủ ESXi của bạn.
   - Veeam sẽ xác thực và kết nối đến máy chủ ESXi.

  ![Hình ảnh thêm máy chủ ESXi](https://github.com/cuongnvvietis/NhanHoa/blob/main/Docs/Esxi/Picture/Veem/Screenshot_82.png)

2. **Xác Thực Kết Nối:**
   - Veeam sẽ xác thực và thu thập thông tin về các máy ảo trên máy chủ ESXi.

## Thiết Lập Job Sao Lưu

1. **Tạo Job Sao Lưu:**
   - Trong giao diện **Home**, chọn **Backup Job** và làm theo các bước hướng dẫn để thiết lập job sao lưu cho các máy ảo trên ESXi.

2. **Chọn Máy Ảo:**
   - Chọn các máy ảo mà bạn muốn sao lưu từ danh sách trên máy chủ ESXi.

3. **Chọn Repository:**
   - Chọn repository để lưu trữ bản sao lưu.

4. **Đặt Lịch Trình Sao Lưu:**
   - Đặt lịch trình sao lưu tự động theo ngày hoặc tuần.

![Hình ảnh tạo job sao lưu](https://github.com/cuongnvvietis/NhanHoa/blob/main/Docs/Esxi/Picture/Veem/Screenshot_74.png)

5. **Hoàn Thành Job Sao Lưu:**
   - Kiểm tra lại các tùy chọn và hoàn tất việc thiết lập job sao lưu.

---

Sau khi hoàn thành, Veeam Backup & Replication sẽ tự động sao lưu các máy ảo theo lịch trình bạn đã cấu hình.
