# Hướng Dẫn Di Chuyển Disk VM Giữa Các Datastore Trên VMware ESXi

Di chuyển một ổ đĩa của máy ảo (VM) giữa các datastore giúp bạn tối ưu hóa không gian lưu trữ hoặc quản lý tài nguyên hiệu quả hơn. Dưới đây là các bước thực hiện.

## Bước 1: Đăng Nhập vSphere Client

1. Mở trình duyệt và truy cập vào **vSphere Client** bằng địa chỉ IP hoặc hostname của ESXi/vCenter.
2. Đăng nhập bằng tài khoản quản trị.

## Bước 2: Tìm Máy Ảo Cần Di Chuyển Disk

1. Trong giao diện vSphere Client, chọn **Tab "Virtual Machines"**.
2. Chọn máy ảo (VM) mà bạn muốn di chuyển ổ đĩa.

   ![Select VM](https://github.com/cuongnvvietis/NhanHoa/blob/main/Docs/Esxi/Picture/Move%20Disk/Screenshot_29.png)

## Bước 3: Tắt Máy Ảo (Nếu Cần)

1. Nhấp chuột phải vào máy ảo cần di chuyển và chọn **Power -> Shut Down Guest OS** hoặc **Power Off**.
   
   ![Shut Down VM](https://github.com/cuongnvvietis/NhanHoa/blob/main/Docs/Esxi/Picture/Move%20Disk/Screenshot_30.png)

## Bước 4: Thực Hiện Lệnh "Migrate" Để Di Chuyển Disk

1. Nhấp chuột phải vào máy ảo đã chọn và chọn **Migrate** từ menu.
   
   ![Migrate VM](https://github.com/cuongnvvietis/NhanHoa/blob/main/Docs/Esxi/Picture/Move%20Disk/Screenshot_31.png)

2. Trong hộp thoại **Migration wizard**, chọn **Change datastore** và nhấn **Next**.

   ![Change Datastore](https://github.com/cuongnvvietis/NhanHoa/blob/main/Docs/Esxi/Picture/Move%20Disk/Screenshot_32.png)

## Bước 5: Chọn Datastore Đích

1. Trong danh sách các datastore, chọn datastore đích mà bạn muốn di chuyển ổ đĩa VM tới.
   
   ![Select Target Datastore](https://github.com/cuongnvvietis/NhanHoa/blob/main/Docs/Esxi/Picture/Move%20Disk/Screenshot_33.png)

2. Nhấn **Next** để tiếp tục.

## Bước 6: Hoàn Thành Quá Trình Di Chuyển

1. Kiểm tra lại thông tin trong phần **Review** và nhấn **Finish** để bắt đầu quá trình di chuyển.

   ![Finish Migration](https://github.com/cuongnvvietis/NhanHoa/blob/main/Docs/Esxi/Picture/Move%20Disk/Screenshot_34.png)

2. Quá trình di chuyển sẽ bắt đầu và hoàn tất trong vài phút, tùy thuộc vào kích thước disk của máy ảo.

   ![Migration Progress](https://github.com/cuongnvvietis/NhanHoa/blob/main/Docs/Esxi/Picture/Move%20Disk/Screenshot_35.png)

## Kết Luận

Sau khi quá trình di chuyển hoàn tất, máy ảo của bạn sẽ sử dụng datastore mới cho ổ đĩa của nó. Hãy kiểm tra lại để đảm bảo rằng máy ảo hoạt động bình thường và datastore mới đã được sử dụng.
