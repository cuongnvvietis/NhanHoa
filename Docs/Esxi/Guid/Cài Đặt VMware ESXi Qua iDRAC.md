# Hướng Dẫn Cài Đặt VMware ESXi Qua iDRAC Trên Máy Chủ Dell PowerEdge

iDRAC (Integrated Dell Remote Access Controller) cho phép bạn cài đặt và quản lý máy chủ Dell PowerEdge từ xa. Dưới đây là hướng dẫn từng bước để cài đặt VMware ESXi qua iDRAC, bao gồm việc sử dụng giao diện HTML5 trong Virtual Console.

## Bước 1: Chuẩn Bị và Đăng Nhập iDRAC

1. **Đăng Nhập iDRAC**:
   - Đăng nhập vào iDRAC bằng tên người dùng và mật khẩu của bạn.

## Bước 2: Sử Dụng Virtual Console HTML5

1. **Chuyển Sang Giao Diện HTML5**:
   - Trong giao diện iDRAC, chọn **Virtual Console** từ thanh điều hướng chính và chuyển Plug-in Type **HTML5**. 

   ![HTML5 Virtual Console](https://github.com/cuongnvvietis/NhanHoa/blob/main/Docs/Esxi/Picture/Setup%20Esxi/Screenshot_9.png)

2. **Khởi Động Máy Chủ Qua Virtual Console**:
   - Từ màn hình giao diện chọn Server -> Launch, bạn sẽ thấy màn hình khởi động của máy chủ. Thực hiện các bước cài đặt ESXi từ giao diện này như bạn làm với một console vật lý.

   ![ESXi Installation via HTML5](https://github.com/cuongnvvietis/NhanHoa/blob/main/Docs/Esxi/Picture/Setup%20Esxi/Screenshot_10.png)

## Bước 3: Tải Lên Tệp Cài Đặt ESXi

1. **Truy Cập Menu Connect Virtual Media**:
   - Trong giao diện iDRAC, chọn **Connect Virtual Media** từ thanh điều hướng chính.

   ![Virtual Media](https://github.com/cuongnvvietis/NhanHoa/blob/main/Docs/Esxi/Picture/Setup%20Esxi/Screenshot_11.png)

## Bước 4: Mount ISO và Khởi Động Từ ISO

1. **Mount Tệp ISO**:
   - Vào menu **Virtual Media** và chọn **Map Device** để tải lên tệp ISO của VMware ESXi.

   ![Map Device](https://github.com/cuongnvvietis/NhanHoa/blob/main/Docs/Esxi/Picture/Setup%20Esxi/Screenshot_12.png)

2. **Khởi Động Lại Máy Chủ**:
   - Sau khi mount xong, chọn **Reset Server** để vào chế độ Boot Manager bằng phím `F11`.

   ![Boot Manager](https://github.com/cuongnvvietis/NhanHoa/blob/main/Docs/Esxi/Picture/Setup%20Esxi/Screenshot_13.png)

3. **Chọn Menu Boot**:
   - Chọn **One-shot BIOS boot menu** và sau đó chọn **Virtual Optical Drive** để boot từ ISO cài đặt ESXi.

   ![Boot Menu](https://github.com/cuongnvvietis/NhanHoa/raw/main/1610197402241.png)

4. **Chờ Boot**:
   - Chờ khoảng 2-5 phút để máy chủ boot vào bộ cài đặt ESXi.

   ![Booting](https://github.com/cuongnvvietis/NhanHoa/raw/main/1610197428452.png)

## Bước 5: Cài Đặt VMware ESXi

1. **Giao Diện Cài Đặt**:
   - Khi bộ cài đặt ESXi load xong, bạn sẽ thấy giao diện cài đặt.

   ![Installation Interface](https://github.com/cuongnvvietis/NhanHoa/raw/main/1610197447671.png)

2. **Tiếp Tục Cài Đặt**:
   - Nhấn `Enter` để tiếp tục cài đặt.

   ![Continue Installation](https://github.com/cuongnvvietis/NhanHoa/raw/main/1610197473186.png)

3. **Chấp Nhận Điều Khoản**:
   - Nhấn `F11` để đồng ý với điều khoản và tiếp tục.

   ![Accept Terms](https://github.com/cuongnvvietis/NhanHoa/raw/main/1610197491446.png)

4. **Chọn Ổ Đĩa Cài Đặt**:
   - Chọn ổ đĩa để cài đặt ESXi và nhấn `Enter` để tiếp tục.

   ![Select Disk](https://github.com/cuongnvvietis/NhanHoa/raw/main/1610197504991.png)

5. **Tạo Mật Khẩu Root**:
   - Tạo mật khẩu cho tài khoản root (ít nhất 7 ký tự) và nhấn `Enter` để tiếp tục.

   ![Set Root Password](https://github.com/cuongnvvietis/NhanHoa/raw/main/1610197517793.png)

6. **Quá Trình Cài Đặt**:
   - Quá trình cài đặt sẽ mất khoảng 2-5 phút. Khi hoàn tất, máy chủ sẽ tự khởi động lại.

   ![Installation Complete](https://github.com/cuongnvvietis/NhanHoa/raw/main/1610197541086.png)

## Bước 6: Cấu Hình ESXi Sau Cài Đặt

1. **Đăng Nhập vào ESXi**:
   - Khi cài đặt xong, bạn sẽ thấy giao diện cấu hình ESXi. Nhấn `F2` để đăng nhập bằng tên người dùng `root` và mật khẩu đã đặt.

   ![ESXi Interface](https://github.com/cuongnvvietis/NhanHoa/raw/main/1610197562882.png)

2. **Cấu Hình Mạng**:
   - Chọn **Configure Management Network** để cấu hình IP và Hostname.
   - Chọn **IPv4** và cấu hình IP tĩnh (nhấn `Space` để chọn mục). Nhấn `Enter` để lưu lại.

   ![Configure Management Network](https://github.com/cuongnvvietis/NhanHoa/raw/main/1610197592828.png)

   - Để thay đổi Hostname và DNS, chọn **DNS Configuration** và chọn **Use the following DNS server addresses and hostname**.

   ![DNS Configuration](https://github.com/cuongnvvietis/NhanHoa/raw/main/1610197700022.png)

3. **Khởi Động Lại Mạng**:
   - Nhấn `ESC` để thoát ra và chọn **Restart Network** để thay đổi IP. Sau đó, dùng trình duyệt web truy cập vào ESXi bằng đường dẫn `https://<IP-ESXI>`.

   ![Restart Network](https://github.com/cuongnvvietis/NhanHoa/raw/main/1610197725272.png)

