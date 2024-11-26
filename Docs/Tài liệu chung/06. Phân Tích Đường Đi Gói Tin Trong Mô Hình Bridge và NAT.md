# Phân Tích Đường Đi Gói Tin Trong Mô Hình Bridge và NAT

## Giới Thiệu

Trong môi trường ảo hóa với KVM/QEMU, có hai mô hình phổ biến để cấu hình mạng cho các máy ảo (VM): **Bridge** và **NAT**. Cả hai mô hình này đều ảnh hưởng trực tiếp đến cách gói tin được truyền đi từ VM ra ngoài mạng và từ mạng bên ngoài vào VM.

## 1. Mô Hình Bridge

![Command Prompt](https://github.com/cuongnvvietis/NhanHoa/blob/main/Docs/Picture/KVM/1.png)

### Cách Thức Hoạt Động:
- Bridge hoạt động như một switch ảo, cho phép máy ảo kết nối trực tiếp với mạng vật lý như các thiết bị khác trong mạng.
- VM nhận địa chỉ IP từ cùng dải mạng của mạng vật lý, thông qua DHCP server của mạng đó (hoặc cấu hình IP tĩnh).
- Gói tin từ VM được truyền trực tiếp qua bridge đến mạng vật lý mà không qua xử lý của host. Máy ảo có thể giao tiếp với các thiết bị khác trong mạng mà không cần NAT.

### Đường Đi Gói Tin:
1. **Gói tin từ VM**: 
   - Gói tin từ VM đi qua giao diện ảo của máy ảo (vNIC).
   - Gói tin này sẽ được truyền đến bridge (switch ảo) trên host.
   - Bridge truyền gói tin này trực tiếp ra mạng vật lý thông qua giao diện mạng thực (NIC) của host.
   - Gói tin sẽ tới đích giống như từ một thiết bị vật lý bình thường trong mạng.
   
2. **Gói tin đến VM**: 
   - Gói tin từ thiết bị khác trong mạng được gửi tới IP của VM.
   - Gói tin này sẽ đi qua bridge và được chuyển đến VM thông qua vNIC.

### Ưu Điểm:
- VM có địa chỉ IP public hoặc địa chỉ trong mạng LAN như các thiết bị vật lý khác.
- Không cần cấu hình thêm NAT.

### Nhược Điểm:
- Cần có quyền quản lý mạng vật lý để tạo bridge.
- VM dễ bị tấn công từ bên ngoài do trực tiếp kết nối với mạng vật lý.

---

## 2. Mô Hình NAT
![Command Prompt](https://github.com/cuongnvvietis/NhanHoa/blob/main/Docs/Picture/KVM/a1.png)
### Cách Thức Hoạt Động:
- Với NAT, host đóng vai trò làm gateway cho các VM. Máy ảo nhận địa chỉ IP từ một dải mạng nội bộ riêng (thường là một dải IP ảo như `192.168.x.x`).
- Host thực hiện quá trình chuyển đổi địa chỉ mạng (NAT) để chuyển các gói tin từ VM ra ngoài và từ bên ngoài vào VM.

### Đường Đi Gói Tin:
1. **Gói tin từ VM**: 
   - Gói tin được gửi từ VM qua vNIC tới host.
   - Host nhận gói tin và thay đổi địa chỉ IP nguồn thành địa chỉ IP của host, sau đó gửi gói tin ra ngoài.
   - Gói tin tiếp tục đi qua mạng vật lý như bình thường, với IP nguồn là IP của host.

2. **Gói tin đến VM**: 
   - Khi một thiết bị bên ngoài gửi gói tin tới địa chỉ IP của host, host sẽ dựa vào các luật NAT để chuyển tiếp gói tin đó tới VM tương ứng.
   - Host thay đổi địa chỉ đích của gói tin thành địa chỉ IP nội bộ của VM và chuyển nó qua vNIC tới VM.

### Ưu Điểm:
- Đơn giản, dễ cấu hình.
- Không cần thay đổi cấu hình mạng vật lý.
- VM được cách ly với mạng bên ngoài, tăng cường bảo mật.

### Nhược Điểm:
- VM không có địa chỉ IP public trực tiếp.
- Khả năng truy cập từ bên ngoài vào VM bị giới hạn, cần cấu hình thêm port forwarding nếu cần.

---

## So Sánh Bridge và NAT

| Tính Năng        | Bridge                                | NAT                                  |
|------------------|---------------------------------------|--------------------------------------|
| Địa chỉ IP        | Cùng dải mạng vật lý                  | Địa chỉ IP riêng do host cấp         |
| Bảo mật           | Ít bảo mật hơn do kết nối trực tiếp   | Bảo mật hơn vì có lớp NAT bảo vệ     |
| Cấu hình          | Cần cấu hình bridge trên host         | Không cần thay đổi cấu hình mạng vật lý |
| Truy cập từ ngoài | Dễ dàng như với thiết bị vật lý       | Cần cấu hình port forwarding         |

---

## Kết Luận

Việc chọn mô hình Bridge hay NAT tùy thuộc vào yêu cầu của hệ thống. Nếu cần kết nối trực tiếp với mạng vật lý và có quyền quản lý mạng, mô hình Bridge là phù hợp. Trong khi đó, nếu ưu tiên tính bảo mật và không yêu cầu máy ảo có địa chỉ IP public, mô hình NAT sẽ là lựa chọn tốt hơn.

