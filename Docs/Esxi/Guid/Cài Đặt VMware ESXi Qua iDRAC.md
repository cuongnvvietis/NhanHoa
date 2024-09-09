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
   - Từ màn hình giao diện chọn Server -> Lauch, bạn sẽ thấy màn hình khởi động của máy chủ. Thực hiện các bước cài đặt ESXi từ giao diện này như bạn làm với một console vật lý.

   ![ESXi Installation via HTML5](https://github.com/cuongnvvietis/NhanHoa/blob/main/Docs/Esxi/Picture/Setup%20Esxi/Screenshot_10.png)

## Bước 3: Tải Lên Tệp Cài Đặt ESXi

1. **Truy Cập Menu Connect Virtual Media**:
   - Trong giao diện iDRAC, chọn ** Connect Virtual Media** từ thanh điều hướng chính.

   ![Virtual Media](https://github.com/cuongnvvietis/NhanHoa/blob/main/Docs/Esxi/Picture/Setup%20Esxi/Screenshot_11.png)

2. **Chọn Mount ISO Image**:
   - Chọn **Mount ISO** để tải lên tệp ISO của VMware ESXi.

   ![Mount ISO](https://github.com/cuongnvvietis/NhanHoa/raw/main/mount_iso.png) <!-- Thay thế bằng liên kết hình ảnh thực tế nếu cần -->

3. **Chọn Tệp ISO**:
   - Nhấp vào **Browse** và chọn tệp ISO của VMware ESXi mà bạn đã tải xuống từ trang web của VMware.

   ![Select ISO](https://github.com/cuongnvvietis/NhanHoa/raw/main/select_iso.png) <!-- Thay thế bằng liên kết hình ảnh thực tế nếu cần -->

## Bước 4: Khởi Động Máy Chủ Từ ISO

1. **Truy Cập Menu Power**:
   - Vào **Power** từ thanh điều hướng chính và chọn **Power Cycle System** hoặc **Power On** để khởi động lại hoặc khởi động máy chủ.

   ![Power Options](https://github.com/cuongnvvietis/NhanHoa/raw/main/power_options.png) <!-- Thay thế bằng liên kết hình ảnh thực tế nếu cần -->

2. **Chọn Boot từ ISO**:
   - Khi máy chủ khởi động, vào menu boot và chọn **Virtual Media** để boot từ tệp ISO đã mount.

   ![Boot Menu](https://github.com/cuongnvvietis/NhanHoa/raw/main/boot_menu.png) <!-- Thay thế bằng liên kết hình ảnh thực tế nếu cần -->

## Bước 5: Cài Đặt VMware ESXi

1. **Bắt Đầu Cài Đặt**:
   - Khi máy chủ khởi động từ tệp ISO, bạn sẽ thấy giao diện cài đặt của VMware ESXi. Thực hiện theo hướng dẫn trên màn hình để bắt đầu cài đặt.

   ![ESXi Installation](https://github.com/cuongnvvietis/NhanHoa/raw/main/esxi_installation.png) <!-- Thay thế bằng liên kết hình ảnh thực tế nếu cần -->

2. **Chọn Đĩa Cứng và Cấu Hình**:
   - Chọn ổ đĩa cứng mà bạn muốn cài đặt ESXi và cấu hình các tùy chọn cần thiết.

   ![Select Disk](https://github.com/cuongnvvietis/NhanHoa/raw/main/select_disk.png) <!-- Thay thế bằng liên kết hình ảnh thực tế nếu cần -->

3. **Hoàn Tất Cài Đặt**:
   - Sau khi hoàn tất cài đặt, hệ thống sẽ yêu cầu khởi động lại. Đảm bảo rằng máy chủ khởi động từ ổ đĩa cứng nơi ESXi đã được cài đặt.

   ![Reboot](https://github.com/cuongnvvietis/NhanHoa/raw/main/reboot.png) <!-- Thay thế bằng liên kết hình ảnh thực tế nếu cần -->

## Tổng Kết

Bằng cách làm theo các bước trên, bạn đã hoàn tất việc cài đặt VMware ESXi qua iDRAC trên máy chủ Dell PowerEdge của bạn. ESXi là một nền tảng ảo hóa mạnh mẽ giúp bạn quản lý và triển khai các máy ảo hiệu quả.

---

Nếu bạn cần thêm thông tin hoặc có bất kỳ câu hỏi nào khác, đừng ngần ngại hỏi nhé!
