1. Thêm Kho CentOS Vault
Vì bạn đang sử dụng CentOS 7, các gói bị thiếu có thể được tìm thấy trong kho CentOS Vault. Thêm kho này vào hệ thống:

Bước 1: Tạo file repo cho CentOS Vault
Tạo file /etc/yum.repos.d/CentOS-Vault.repo:

bash
Sao chép mã
sudo vi /etc/yum.repos.d/CentOS-Vault.repo
Thêm nội dung sau:

ini
Sao chép mã
[centos-vault]
name=CentOS Vault - $basearch
baseurl=http://vault.centos.org/7.9.2009/os/$basearch/
gpgcheck=1
enabled=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7
2. Cài đặt các gói bị thiếu
Bước 1: Cập nhật lại danh sách gói
Chạy lệnh để cập nhật:

bash
Sao chép mã
sudo yum clean all
sudo yum makecache
Bước 2: Cài đặt harfbuzz và fribidi
Thử cài đặt lại các gói:

bash
Sao chép mã
sudo yum install harfbuzz fribidi -y

4. Xử lý nếu lỗi vẫn xảy ra
Nếu bạn vẫn gặp lỗi, có thể file tải xuống đã bị lỗi hoặc hệ thống bị vấn đề về rpm.

Xóa và tải lại key từ nguồn khác
Xóa file cũ:

bash
Sao chép mã
sudo rm -f /etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7
Tải key từ nguồn dự phòng:

bash
Sao chép mã
sudo curl -o /etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7 https://www.centos.org/keys/RPM-GPG-KEY-CentOS-7
Thử thêm lại:

bash
Sao chép mã
sudo rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7
