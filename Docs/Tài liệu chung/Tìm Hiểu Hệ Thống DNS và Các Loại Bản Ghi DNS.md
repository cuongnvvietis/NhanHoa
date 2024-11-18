# Tìm Hiểu Hệ Thống DNS và Các Loại Bản Ghi DNS

## 1. **Hệ thống DNS là gì?**
DNS (Domain Name System) là hệ thống phân giải tên miền, giúp chuyển đổi từ tên miền (domain name) mà con người dễ nhớ (ví dụ: `google.com`) sang địa chỉ IP mà máy tính hiểu được (ví dụ: `142.250.190.46`). 

Hệ thống DNS bao gồm các thành phần chính:
- **Root Servers**: Quản lý tất cả tên miền cấp cao nhất (TLD).
- **TLD Servers**: Quản lý các tên miền như `.com`, `.org`, `.net`, `.vn`, ...
- **Authoritative Servers**: Quản lý thông tin DNS của các tên miền cụ thể.
- **Resolvers (DNS Cache)**: Hỗ trợ tìm kiếm và lưu trữ tạm thời kết quả DNS.

## 2. **Các loại bản ghi DNS**
Dưới đây là các loại bản ghi DNS phổ biến và cách kiểm tra:

### **A (Address Record)**
- **Chức năng**: Ánh xạ một domain sang địa chỉ IPv4.
- **Ví dụ cấu hình**:
example.com.    IN    A    192.168.1.1
Cách kiểm tra:
```
dig example.com A
nslookup example.com
```
AAAA (IPv6 Address Record)
Chức năng: Ánh xạ domain sang địa chỉ IPv6.
Ví dụ cấu hình:
example.com.    IN    AAAA    2401:db00::1234

Cách kiểm tra:
```
dig example.com AAAA
nslookup example.com
```
CNAME (Canonical Name Record)
Chức năng: Chuyển hướng từ một domain sang một domain khác.
Ví dụ cấu hình:
www.example.com.    IN    CNAME    example.com.
Cách kiểm tra:
```
dig www.example.com CNAME
nslookup www.example.com
```
MX (Mail Exchange Record)
Chức năng: Chỉ định máy chủ nhận email cho domain.
Ví dụ cấu hình:
example.com.    IN    MX    10 mail.example.com.
Cách kiểm tra:

```
dig example.com MX
nslookup -query=MX example.com
```

TXT (Text Record)
Chức năng: Lưu trữ thông tin dạng văn bản (SPF, DKIM, xác thực domain, ...).
Ví dụ cấu hình:

example.com.    IN    TXT    "v=spf1 include:_spf.google.com ~all"
Cách kiểm tra:

```
dig example.com TXT
nslookup -query=TXT example.com
```
NS (Name Server Record)
Chức năng: Xác định máy chủ DNS chịu trách nhiệm cho domain.
Ví dụ cấu hình:

example.com.    IN    NS    ns1.example.com.
example.com.    IN    NS    ns2.example.com.
Cách kiểm tra:
```
dig example.com NS
nslookup -query=NS example.com
```
SOA (Start of Authority)
Chức năng: Chứa thông tin quản trị DNS (máy chủ chính, người quản trị, thông số zone).
Ví dụ cấu hình:

example.com.    IN    SOA    ns1.example.com. admin.example.com. 2024111801 3600 7200 1209600 86400
Cách kiểm tra:
```
dig example.com SOA
nslookup -query=SOA example.com
```

## 3. **Ví dụ Kiểm Tra Toàn Bộ Domain**
Sử dụng lệnh sau để kiểm tra tất cả các bản ghi DNS cho một domain:

dig example.com ANY
Kiểm tra cụ thể hơn:

```
host -t A example.com
host -t MX example.com
```
Sử dụng công cụ web
Công cụ trực tuyến: MXToolbox
Nhập domain và kiểm tra bản ghi DNS.
