# Hướng dẫn cấu hình Multi-VLAN trên Hyper-V với NIC Teaming

## 1. Giới thiệu
Hướng dẫn này giúp bạn cấu hình nhiều VLAN trên Hyper-V bằng cách sử dụng **NIC Teaming** để gộp các card mạng vật lý và gán VLAN riêng cho từng card mạng ảo.

## 2. Yêu cầu
- Windows Server với Hyper-V đã cài đặt.
- Tối thiểu 2 card mạng vật lý (NIC) trên máy chủ.
- Switch hỗ trợ VLAN (nếu sử dụng chế độ LACP).

## 3. Các bước thực hiện

### Bước 1: Tạo NIC Teaming trên Hyper-V Host
1. **Mở Server Manager**:
    - Vào **Server Manager** > **Local Server**.
    - Trong phần **NIC Teaming**, chọn **Disabled** để mở trình quản lý NIC Teaming.

2. **Tạo NIC Team**:
    - Chọn **Tasks** > **New Team**.
    - Chọn các NIC vật lý để gộp vào team (ví dụ: `NIC1`, `NIC2`).
    - Đặt tên cho NIC Team, ví dụ: `NIC_Team_VLAN`.
![Command Prompt](https://github.com/cuongnvvietis/NhanHoa/blob/main/Docs/Picture/Hyper-v/Screenshot_28.png)

3. **Cấu hình Teaming Mode và Load Balancing**:
    - **Teaming Mode**: Chọn **Switch Independent** hoặc **LACP** (nếu switch hỗ trợ).
    - **Load Balancing Mode**: Chọn **Dynamic**.

4. **Lưu cấu hình** để tạo NIC Team.

### Bước 2: Tạo Virtual NICs cho từng VLAN
1. Trong cửa sổ NIC Teaming, chọn **Properties** của `NIC_Team_VLAN`.
2. Chuyển sang tab **VLAN** và tạo Virtual NIC cho từng VLAN.
    - **Virtual NIC cho VLAN 10**:
        - Đặt tên: `NIC_VLAN10`.
        - VLAN ID: `10`.
    - **Virtual NIC cho VLAN 11**:
        - Đặt tên: `NIC_VLAN11`.
        - VLAN ID: `11`.
![Command Prompt](https://github.com/cuongnvvietis/NhanHoa/blob/main/Docs/Picture/Hyper-v/Screenshot_29.png)

### Bước 3: Cấu hình Hyper-V Virtual Switch
1. Chạy câu lệnh trên để tạo Virtual Switch cho Vlan 10 và Vlan 11
   
![Command Prompt](https://github.com/cuongnvvietis/NhanHoa/blob/main/Docs/Picture/Hyper-v/Screenshot_11.png)

### Bước 4: Gán Virtual NIC cho các máy ảo
1. Mở **Hyper-V Manager** và chọn máy ảo cần cấu hình.
2. Chọn **Settings** của máy ảo, vào phần **Network Adapter**.
3. Chọn Virtual Switch tương ứng (ví dụ: **Switch_VLAN10** hoặc **Switch_VLAN11**).
