# Hướng dẫn Tạo Container trong OpenVZ

Trong các bài hướng dẫn trước, chúng ta đã tìm hiểu:

- Cách cài đặt và cấu hình OpenVZ trên CentOS

Hôm nay, chúng ta sẽ tìm hiểu cách tạo Container trong OpenVZ.

## Container là gì?

Các máy ảo trong OpenVZ được gọi là **Container**. Không giống như các máy ảo truyền thống của VMWare, KVM, hay Oracle VirtualBox, Container trong OpenVZ chia sẻ tài nguyên của máy vật lý một cách linh hoạt. Điều này có nghĩa là không cần phân bổ cố định RAM hay dung lượng đĩa cho một Container cụ thể; thay vào đó, tài nguyên sẽ được chia sẻ đều cho tất cả các Container dựa trên nhu cầu.

## Tạo Container trong OpenVZ

### 1. Chuẩn bị Template

Danh sách các template có sẵn được tìm thấy tại: [OpenVZ Templates](http://openvz.org/Download/template/precreated).

Ở đây, chúng ta sẽ tạo một Container CentOS 7 và gán địa chỉ IP là `172.16.2.162`.

- Đăng nhập vào máy chủ OpenVZ vật lý và truy cập thư mục `/vz/template/cache`, nơi lưu trữ các template đã tải xuống.

    ```bash
    cd /vz/template/cache/
    ```

- Tải template CentOS 7 tối thiểu:

    ```bash
    wget http://download.openvz.org/template/precreated/centos-7-x86_64-minimal.tar.gz
    ```

- **Lưu ý:** Không cần giải nén file `.tar.gz`. Chỉ cần để nguyên file này trên máy chủ vật lý.

### 2. Tạo Container

Chạy lệnh sau để tạo máy ảo đầu tiên:

```bash
vzctl create 101 --ostemplate centos-7-x86_64-minimal
```
Giải thích:

101 là ID của Container (thường bắt đầu từ 100).

### 3. Thiết lập IP cho Container
Gán địa chỉ IP 172.16.2.162 cho Container:

```
vzctl set 101 --ipadd 172.16.2.162 --save
```
Gán DNS cho Container:
```
vzctl set 101 --nameserver 8.8.8.8 --save
```
### 4. Khởi động Container
Chạy lệnh sau để khởi động Container mới tạo:

```
vzctl start 101
```
Kiểm tra kết nối tới Container bằng cách ping từ máy chủ vật lý:

```
ping 172.16.2.162
```
### 5. Đăng nhập vào Container
Sử dụng lệnh sau để truy cập vào Container:

```
vzctl enter 101
```
Để thoát và quay lại máy chủ vật lý, gõ lệnh:

```
exit
```
### 6. Cấu hình Firewall để truy cập Container từ xa
Đăng nhập vào máy chủ vật lý (máy OpenVZ).

Sửa file /etc/sysconfig/iptables:

```
vi /etc/sysconfig/iptables
```
Thêm các dòng sau vào giữa các dòng FORWARD ACCEPT [0:0] và OUTPUT ACCEPT [0:0]:
```
-P FORWARD ACCEPT
-F FORWARD
```
Đảm bảo dòng sau đã được comment:

```
#-A FORWARD -j REJECT --reject-with icmp-host-prohibited
```
Lưu và đóng file, sau đó khởi động lại dịch vụ iptables để áp dụng thay đổi:

```
service iptables restart
```
### 7. Thêm RAM và dung lượng đĩa cho Container
Mặc định, Container mới sẽ có 256 MB RAM, 512 MB vSwap Memory, và 2 GB dung lượng đĩa. Để thay đổi các giá trị này, chỉnh sửa file /etc/vz/conf/101.conf (với 101 là ID của Container).

Sửa file:

```
vi /etc/vz/conf/101.conf
```
Tìm và thay đổi các dòng sau theo nhu cầu:
```
# RAM
PHYSPAGES="0:512M"

# Swap
SWAPPAGES="0:1G"

# Disk quota parameters (in form of softlimit:hardlimit)
DISKSPACE="5G:5.5G"
DISKINODES="131072:144179"
```
