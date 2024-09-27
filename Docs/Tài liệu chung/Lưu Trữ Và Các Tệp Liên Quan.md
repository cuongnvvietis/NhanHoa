# Máy Ảo (VM) Trong KVM/QEMU: Lưu Trữ Và Các Tệp Liên Quan

## 1. Máy Ảo Được Lưu Ở Đâu?

Máy ảo trên hệ thống **libvirt** sử dụng KVM/QEMU thường được lưu trữ ở hai vị trí chính:

- **Tệp cấu hình XML** của máy ảo được lưu trong thư mục `/etc/libvirt/qemu/`. Mỗi máy ảo có một tệp XML lưu trữ cấu hình phần cứng, mạng, và các thông tin khác.
  
- **Ổ đĩa ảo (disk image)** của máy ảo thường được lưu trong:
  - `/var/lib/libvirt/images/`: Vị trí mặc định lưu trữ các tệp đĩa ảo (thường có định dạng `.qcow2`, `.raw`).
  - Các vị trí tùy chỉnh: Nếu bạn chỉ định vị trí riêng, ổ đĩa ảo có thể được lưu ở bất kỳ thư mục nào bạn cấu hình trong tệp XML.

## 2. Mỗi Thư Mục Của Máy Ảo Có Các Tệp Như Thế Nào?

Một máy ảo điển hình trong libvirt có các tệp sau:

### a) Tệp Cấu Hình XML (`/etc/libvirt/qemu/<vm_name>.xml`)
- Tệp này chứa cấu hình máy ảo, bao gồm tài nguyên phần cứng (CPU, RAM), cấu hình mạng, ổ đĩa ảo, và các thiết bị khác.

### b) Tệp Đĩa Ảo (Disk Image)
- Đây là tệp chứa hệ điều hành và dữ liệu của máy ảo. Các tệp này thường có các định dạng:
  - **`qcow2`**: Định dạng phổ biến hỗ trợ snapshot, nén và phân bổ dung lượng động.
  - **`raw`**: Định dạng thô, thường nhanh hơn nhưng không hỗ trợ tính năng như `qcow2`.

Ví dụ: 
- `/var/lib/libvirt/images/my_vm.qcow2`: Đây là tệp đĩa ảo của máy ảo `my_vm`.

### c) Tệp Lưu Trữ Trạng Thái (State File)
- Khi tạm dừng (suspend) máy ảo, trạng thái của máy sẽ được lưu trong tệp tạm thời (thường là trong `/var/lib/libvirt/qemu/save/`).
- **Snapshot**: Nếu tạo snapshot của máy ảo, chúng sẽ được lưu kèm với tệp đĩa `qcow2` hoặc trong metadata riêng.

### d) Tệp Log (Log File)
- Log của máy ảo được lưu trong `/var/log/libvirt/qemu/`, ghi lại thông tin về khởi động, tắt máy, và lỗi liên quan đến máy ảo.

## 3. Làm Rõ Thông Tin Trong Từng File

### a) Tệp Cấu Hình XML
- **CPU & RAM**: Thông tin về CPU và RAM được cấp phát cho máy ảo.
- **Ổ đĩa**: Đường dẫn và định dạng của ổ đĩa ảo.
- **Mạng**: Cấu hình mạng (bridge, NAT, v.v.).
- **Thiết bị**: Các thiết bị khác như USB, CD-ROM.

### b) Tệp Đĩa Ảo
- **`qcow2`**: Hỗ trợ tính năng snapshot, nén và phân bổ dung lượng động.
- **`raw`**: Định dạng nhanh hơn nhưng không hỗ trợ tính năng nâng cao.

### c) Tệp Lưu Trữ Trạng Thái
- Trạng thái tạm dừng của máy ảo được lưu vào tệp để khôi phục khi máy được bật lại.

### d) Tệp Log
- Ghi lại các sự kiện liên quan đến hoạt động của máy ảo, rất hữu ích cho việc gỡ lỗi.

## Tổng Kết

- Máy ảo được lưu trong các tệp cấu hình XML và các tệp đĩa ảo.
- Tệp XML lưu trữ thông tin cấu hình phần cứng, mạng và các thiết bị khác.
- Tệp đĩa ảo (`qcow2`, `raw`) chứa hệ điều hành và dữ liệu của máy ảo.
- Các tệp log và trạng thái giúp quản lý và theo dõi hoạt động của máy ảo.

