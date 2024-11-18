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

Cách kiểm tra:
```
dig nhanhoa.com A
```

### **AAAA (IPv6 Address Record)**

AAAA (IPv6 Address Record)
Chức năng: Ánh xạ domain sang địa chỉ IPv6.

Cách kiểm tra:
```
dig nhanhoa.com AAAA
```
Giải thích 

```plaintext
nhanhoa.com.            293     IN      A       104.22.4.116
nhanhoa.com.            293     IN      A       172.67.22.61
nhanhoa.com.            293     IN      A       104.22.5.116

;; ANSWER SECTION:
nhanhoa.com.            228     IN      AAAA    2606:4700:10::ac43:163d
nhanhoa.com.            228     IN      AAAA    2606:4700:10::6816:474
nhanhoa.com.            228     IN      AAAA    2606:4700:10::6816:574
```
Thời gian TTL: 293 giây. Sau khoảng thời gian này, bản ghi cần được làm mới từ máy chủ DNS.
Đây là các địa chỉ IPv4 tương ứng với tên miền nhanhoa.com.
Website này có nhiều địa chỉ IP, cho thấy nó sử dụng cơ chế tăng tính sẵn sàng và cân bằng tải.

### **CNAME (Canonical Name Record)**
CNAME (Canonical Name Record)
Chức năng: Chuyển hướng từ một domain sang một domain khác.

Cách kiểm tra:
```
dig www.nhanhoa.com.vn CNAME
```
```
;; ANSWER SECTION:
www.nhanhoa.com.        300     IN      CNAME   nhanhoa.com.
```
Giải thích: Kết quả CNAME: Tên miền www.nhanhoa.com.vn được ánh xạ tới nhanhoa.com.vn

### **MX (Mail Exchange Record)**
Chức năng: Chỉ định máy chủ nhận email cho domain.
Cách kiểm tra:

```
dig example.com MX
```

```
;; ANSWER SECTION:
www.nhanhoa.com.        195     IN      CNAME   nhanhoa.com.
nhanhoa.com.            163     IN      MX      21 mail.nhanhoa.com.
```
Giải thích: MX: nhanhoa.com sử dụng máy chủ email mail.nhanhoa.com với priority 21.

### **TXT (Address Record)**
TXT (Text Record)
Chức năng: Lưu trữ thông tin dạng văn bản (SPF, DKIM, xác thực domain, ...).

Cách kiểm tra:

```
dig nhanhoa.com TXT
nslookup -query=TXT example.com
```

Nội dung bản ghi TXT:
Google Site Verification:
```
google-site-verification=gvC6jb4r4D7S9aMNKDwHz2SILpshsMlhFocxt2tiwB8
```
Bản ghi này dùng để xác minh quyền sở hữu tên miền trên Google (Google Search Console, Google Ads, ...).
SPF (Sender Policy Framework):
```
v=spf1 a mx ptr ip4:103.28.36.250 mx:mail.nhanhoa.com.vn include:_spf.google.com ~all
```

Bản ghi này dùng để xác thực email, giảm nguy cơ email giả mạo (phishing).
Giải thích chi tiết:
a: Chấp nhận các email từ địa chỉ IP tương ứng với bản ghi A.
mx: Chấp nhận các email từ máy chủ email (MX) được cấu hình.
ptr: Chấp nhận các email có IP khớp với bản ghi PTR.
ip4:103.28.36.250: Chỉ định IP được phép gửi email.
mx:mail.nhanhoa.com.vn: Máy chủ email mail.nhanhoa.com.vn được phép gửi email.
include:_spf.google.com: Bao gồm các quy tắc SPF từ Google.
~all: Thư từ nguồn không được liệt kê trong bản ghi sẽ bị đánh dấu là "không được phép" nhưng vẫn có thể được nhận (chế độ mềm).

### **NS (Name Server Record))**
Chức năng: Xác định máy chủ DNS chịu trách nhiệm cho domain.
Cách kiểm tra:
```
dig nhanhoa.com NS
```
Ý Nghĩa
Máy chủ DNS: nhanhoa.com.vn được quản lý bởi 4 máy chủ tên:
ns2011.nhanhoa.com.vn
ns2012.nhanhoa.com.vn
ns2013.nhanhoa.com.vn
ns2014.nhanhoa.com.vn
Các máy chủ DNS này chịu trách nhiệm xử lý các truy vấn DNS cho tên miền nhanhoa.com.vn.

### **SOA (Start of Authority))**
Chức năng: Chứa thông tin quản trị DNS (máy chủ chính, người quản trị, thông số zone).
Cách kiểm tra:
```
dig nhanhoa.com SOA
```
Truy vấn: Tìm bản ghi SOA (Start of Authority) của tên miền nhanhoa.com.vn.
ANSWER SECTION
```
nhanhoa.com.vn.         2210    IN      SOA     ns2011.nhanhoa.com.vn. hostmaster. 238 1800 600 1209600 3600
```
TTL: 2210 giây (~36.8 phút) – Bản ghi sẽ được lưu trữ trong cache trong thời gian này.
Chi tiết bản ghi SOA:

Primary NS: ns2011.nhanhoa.com.vn – Máy chủ tên chính quản lý tên miền.

Email quản trị: hostmaster – Địa chỉ email của người quản trị DNS. (Dấu chấm thứ hai ngụ ý email: 
hostmaster@nhanhoa.com.vn).

Serial Number: 238 – Số phiên bản của cấu hình DNS. Thay đổi khi DNS được cập nhật.

Refresh Time: 1800 giây (30 phút) – Máy chủ phụ kiểm tra máy chủ chính để cập nhật dữ liệu.

Retry Time: 600 giây (10 phút) – Khoảng thời gian thử lại khi không kết nối được với máy chủ chính.

Expire Time: 1209600 giây (14 ngày) – Thời gian máy chủ phụ lưu bản sao DNS trước khi coi là hết hạn.

Minimum TTL: 3600 giây (1 giờ) – Thời gian mặc định để các máy chủ DNS cache thông tin.

## 3. **Ví dụ Kiểm Tra Toàn Bộ Domain**
Sử dụng lệnh sau để kiểm tra tất cả các bản ghi DNS cho một domain:
```
dig nhanhoa.com ANY
```

# Hướng Dẫn Các Bản Ghi DNS (PTR, SRV, CAA, DS, DNSKEY)

## **1. PTR (Pointer Record)**
- **Chức năng:** 
  - Dùng để ánh xạ địa chỉ IP ngược trở lại tên miền (Reverse DNS Lookup).
- **Ví dụ:**
  - Địa chỉ IP `192.168.1.1` có thể ánh xạ ngược thành `example.com`.
- **Cách kiểm tra:**
```
dig -x 113.164.228.219
```
Kết quả truy vấn:
```
219.228.164.113.in-addr.arpa. 3597 IN   PTR     static.vnpt.vn.
```

Bản ghi PTR đã được thiết lập, ánh xạ địa chỉ IP 113.164.228.219 ngược lại thành tên miền static.vnpt.vn.

## **2. SRV (Service Record)**
- **Chức năng:** 
  - Chỉ định thông tin về các dịch vụ cụ thể, như giao thức, port, và độ ưu tiên cho dịch vụ.
- **Ứng dụng:**
  - Dùng trong các hệ thống như SIP, XMPP, và Active Directory.

- **Cách kiểm tra:**
```
dig _sip._tcp.example.com SRV
```

## **3. CAA (Certification Authority Authorization)**
- **Chức năng:** 
  - Quy định nhà cung cấp chứng chỉ (CA) nào được phép phát hành chứng chỉ SSL/TLS cho tên miền.
- **Ví dụ:**
```
example.com. 86400 IN CAA 0 issue "letsencrypt.org"
```
  - Chỉ cho phép Let's Encrypt phát hành chứng chỉ SSL cho `example.com`.
- **Cách kiểm tra:**
```
dig example.com CAA
```

## **4. DS (Delegation Signer Record)**
- **Chức năng:** 
  - Dùng trong DNSSEC (DNS Security Extensions), cung cấp chữ ký số để xác minh tính toàn vẹn của bản ghi DNS.
- **Ví dụ:**
```
example.com. 86400 IN DS 12345 13 2 49FD46E6C4B45C55D4AC...
```
  - `12345`: Key tag.
  - `13`: Thuật toán sử dụng (ví dụ: ECDSA).
  - `2`: Loại hàm băm (SHA-256).
  - Giá trị hàm băm: `49FD46...`.
- **Cách kiểm tra:**
```
dig example.com DS
```

---

## **5. DNSKEY**
- **Chức năng:** 
  - Là một phần của DNSSEC, chứa khóa công khai để xác minh chữ ký số trong DNSSEC.
- **Ví dụ:**
```
example.com. 86400 IN DNSKEY 256 3 8 AwEAAdE...
```
  - `256`: Loại khóa (256 là khóa ZSK, 257 là khóa KSK).
  - `3`: Sử dụng DNSSEC.
  - `8`: Thuật toán (RSA/SHA-256).
  - Giá trị khóa: `AwEAAdE...`.
- **Cách kiểm tra:**
```
dig example.com DNSKEY
```
