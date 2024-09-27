## Cấu hình CPU trong Virt-Manager (KVM/QEMU)

### 1. **Logical host CPUs**: 
   - Đây là số lượng **CPU logic** trên hệ thống máy chủ vật lý (host). Trong trường hợp này, máy chủ vật lý có tổng cộng 16 CPU logic.

### 2. **Current allocation**:
   - **Current allocation = 2**: Đây là số lượng **CPU ảo (vCPU)** được cấp phát hiện tại cho máy ảo này. Máy ảo sẽ sử dụng 2 vCPU.

### 3. **Maximum allocation**:
   - **Maximum allocation = 2**: Đây là số lượng **CPU ảo tối đa** mà máy ảo có thể được cấp phát. Tùy chọn này xác định giới hạn CPU tối đa mà bạn có thể tăng lên khi máy ảo đang chạy. Vì cấu hình hiện tại cũng đang sử dụng 2 CPU, nên bạn không thể tăng thêm khi máy ảo đang chạy.

### 4. **Model**:
   - **Model = SandyBridge-IBRS**: Đây là mô hình CPU ảo được chọn cho máy ảo. `SandyBridge-IBRS` là một mô hình CPU cụ thể thuộc thế hệ Sandy Bridge của Intel. Mô hình này giúp tối ưu hóa hiệu suất của máy ảo, mô phỏng hành vi của CPU vật lý theo một thế hệ CPU cụ thể.

### 5. **Enable available CPU security flaw mitigations**:
   - Đây là tùy chọn kích hoạt các biện pháp **bảo mật lỗi CPU** để bảo vệ máy ảo khỏi các lỗ hổng như **Spectre** và **Meltdown**. Khi được kích hoạt, máy ảo sẽ sử dụng các bản vá bảo mật CPU, nhưng có thể giảm một phần hiệu suất.

### 6. **Topology**:
   - **Manually set CPU topology**: Tùy chọn này cho phép bạn tự thiết lập **topology** của CPU (cách cấu trúc CPU). Điều này có nghĩa là bạn có thể tùy chỉnh số lượng **sockets**, **cores** (nhân), và **threads** (luồng) cho máy ảo.

### 7. **Sockets**:
   - **Sockets = 2**: Đây là số lượng **socket ảo** được cấu hình. Trong trường hợp này, máy ảo có 2 socket CPU ảo, mỗi socket đại diện cho một CPU vật lý giả lập.

### 8. **Cores**:
   - **Cores = 1**: Mỗi socket CPU ảo có 1 nhân CPU (core). Điều này có nghĩa là mỗi CPU chỉ có 1 nhân.

### 9. **Threads**:
   - **Threads = 1**: Mỗi nhân CPU (core) có 1 luồng (thread). Điều này có nghĩa là không có công nghệ như Hyper-Threading được áp dụng ở đây, mỗi nhân CPU chỉ xử lý 1 luồng.

### Tổng kết:
- Máy ảo này có cấu hình **2 socket** với **1 nhân CPU** và **1 luồng** trên mỗi socket, tổng cộng là **2 vCPU**.
- Máy ảo được cấu hình với mô hình CPU **SandyBridge-IBRS** của Intel.
- Kích hoạt các biện pháp bảo mật lỗi CPU để bảo vệ khỏi các lỗ hổng CPU phổ biến.

-------------------------------------------------------------------------------
## Cấu hình Virtual Disk trong Virt-Manager (KVM/QEMU)

### 1. **Source path**:
   - **Source path = /var/lib/libvirt/images/ubuntu20|04.qcow2**: Đây là đường dẫn đến tệp ảnh đĩa ảo (disk image) được sử dụng cho máy ảo. Trong trường hợp này, ảnh đĩa sử dụng định dạng **QCOW2** và nằm trong thư mục `/var/lib/libvirt/images/`.

### 2. **Device type**:
   - **Device type = VirtIO Disk 1**: Đây là kiểu thiết bị đĩa được sử dụng cho máy ảo. **VirtIO** là giao diện I/O ảo hóa hiệu suất cao cho các thiết bị lưu trữ. Sử dụng VirtIO giúp tối ưu hóa tốc độ truyền dữ liệu giữa máy ảo và ổ đĩa ảo.

### 3. **Storage size**:
   - **Storage size = 25.00 GiB**: Dung lượng lưu trữ của ổ đĩa ảo này là 25 GiB.

### 4. **Readonly**:
   - **Readonly = Unchecked**: Tùy chọn này chưa được kích hoạt, có nghĩa là đĩa ảo này **không phải đĩa chỉ đọc** và có thể ghi dữ liệu lên đó.

### 5. **Shareable**:
   - **Shareable = Unchecked**: Tùy chọn này chưa được kích hoạt, có nghĩa là đĩa ảo này **không được chia sẻ** với các máy ảo khác. Nếu được kích hoạt, đĩa này có thể được chia sẻ giữa nhiều máy ảo (dùng chung một đĩa).

### Advanced options (Tùy chọn nâng cao):

#### 6. **Disk bus**:
   - **Disk bus = VirtIO**: Đây là loại **bus** của thiết bị đĩa. **VirtIO** là một giao diện I/O được tối ưu hóa hiệu suất cao, thường được sử dụng trong các môi trường ảo hóa. Nó cung cấp tốc độ truyền tải nhanh hơn so với các loại bus khác như IDE hoặc SATA.

#### 7. **Serial number**:
   - **Serial number = (trống)**: Đây là trường cho phép chỉ định số serial cho ổ đĩa ảo. Nếu không điền, Virt-Manager sẽ không gán số serial cho đĩa này.

#### 8. **Storage format**:
   - **Storage format = qcow2**: Định dạng của tệp đĩa ảo là **QCOW2**. Đây là định dạng đĩa linh hoạt, hỗ trợ **snapshot**, **thin provisioning** (chỉ phân bổ không gian khi cần), và nén dữ liệu.

### Performance options (Tùy chọn hiệu suất):

#### 9. **Cache mode**:
   - **Cache mode = Hypervisor default**: Chế độ **cache** cho đĩa ảo. **Hypervisor default** để hệ thống quản lý tự động. Một số tùy chọn khác bao gồm:
     - **none**: Không sử dụng bộ nhớ đệm, dữ liệu được ghi trực tiếp lên đĩa.
     - **writeback**: Ghi dữ liệu vào bộ nhớ đệm trước khi ghi lên đĩa vật lý, giúp tăng tốc độ ghi nhưng có nguy cơ mất dữ liệu khi máy chủ gặp sự cố.
     - **writethrough**: Ghi trực tiếp dữ liệu vào đĩa vật lý đồng thời lưu trong bộ nhớ đệm, an toàn hơn nhưng có thể chậm hơn.

#### 10. **IO mode**:
   - **IO mode = Hypervisor default**: Chế độ truy xuất I/O cho đĩa. **Hypervisor default** để mặc định. Các tùy chọn khác như:
     - **native**: Sử dụng truy xuất I/O của hệ điều hành host.
     - **threads**: Sử dụng nhiều luồng để quản lý I/O, có thể tăng hiệu suất trong một số trường hợp.

#### 11. **Discard mode**:
   - **Discard mode = Hypervisor default**: Tùy chọn này cấu hình việc hỗ trợ lệnh **discard** hoặc **TRIM**, thường dùng để thông báo các khối không còn được sử dụng. Điều này có thể giúp tối ưu hóa không gian đĩa trong các đĩa ảo **QCOW2** hoặc **SSD**.

#### 12. **Detect zeroes**:
   - **Detect zeroes = Hypervisor default**: Khi bật tùy chọn này, hệ thống sẽ tối ưu hóa việc xử lý các khối dữ liệu toàn **0**. Các tùy chọn khác bao gồm:
     - **on**: Hệ thống sẽ phát hiện các khối toàn 0 và tối ưu hóa chúng để giảm dung lượng đĩa.
     - **off**: Không tối ưu hóa dữ liệu toàn 0.

### Tổng kết:
- Máy ảo này sử dụng đĩa ảo **QCOW2** có dung lượng 25 GiB, với **VirtIO** làm bus cho đĩa, cung cấp hiệu suất I/O cao.
- Các tùy chọn **hiệu suất** như **cache mode**, **IO mode**, và **discard** đang để ở chế độ **Hypervisor default**, nghĩa là hệ thống sẽ quyết định cách tối ưu tốt nhất.


