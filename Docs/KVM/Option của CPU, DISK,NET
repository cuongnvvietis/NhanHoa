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
