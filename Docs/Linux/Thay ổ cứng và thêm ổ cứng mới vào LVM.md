# Thay ổ cứng và thêm ổ cứng mới vào LVM

## 1. Thay ổ cứng cũ

### Bước 1: Kiểm tra thông tin ổ cứng hiện tại
    ```bash
    lsblk
    
### Bước 2: Xác định Logical Volume và Volume Group chứa ổ cứng cũ

    sudo pvdisplay
    sudo vgdisplay
    sudo lvdisplay
    
### Bước 3: Thêm ổ cứng mới vào LVM

    sudo pvcreate /dev/sdX  # Thay sdX bằng tên ổ cứng mới.
    
![Command Prompt](https://github.com/cuongnvvietis/NhanHoa/blob/main/Docs/Esxi/Picture/Add%20Storage/Screenshot_141.png)

### Bước 4: Thêm ổ cứng mới vào Volume Group (Nếu sử dụng lệnh pvmove /dev/sdX theo trường hợp 1)

    sudo vgextend vg_name /dev/sdX  # Thay vg_name bằng tên Volume Group và sdX bằng tên ổ cứng mới.  
    
 ![Command Prompt](https://github.com/cuongnvvietis/NhanHoa/blob/main/Docs/Esxi/Picture/Add%20Storage/Screenshot_141.png)
 
### Bước 5: Di dời dữ liệu từ ổ cứng cũ (nếu cần)
    
   Nếu ổ cứng cũ là một phần của Volume Group, bạn cần phải di dời dữ liệu ra khỏi nó trước khi thay thế. Sử dụng `pvmove` để di chuyển dữ liệu:

   **1. Di dời dữ liệu từ ổ cứng cũ (không chỉ định ổ đích)**

   - **Khi sử dụng:**
     - Khi bạn muốn di dời dữ liệu từ ổ cứng cũ sang các ổ cứng khác trong cùng một Volume Group.
     - Khi bạn không cần chỉ định ổ đích cụ thể cho việc di dời dữ liệu.
     - Khi bạn đã có đủ dung lượng trống trên các ổ cứng còn lại trong Volume Group để chứa dữ liệu từ ổ cứng cũ.

   - **Lệnh:**
     ```bash
     sudo pvmove /dev/sdX  # Thay sdX bằng tên ổ cứng cũ.
     ```

   - **Ví dụ sử dụng:**
     - Bạn có một ổ cứng cũ sắp bị thay thế và muốn di dời dữ liệu sang các ổ cứng khác có sẵn trong Volume Group mà không cần thêm ổ cứng mới.


   **2. Di dời dữ liệu đến ổ đích**

   - **Khi sử dụng:**
     - Khi bạn có một ổ cứng đích mới và muốn di dời dữ liệu từ ổ cứng cũ sang ổ cứng đích này.
     - Khi bạn muốn chỉ định rõ ràng ổ đích nơi dữ liệu từ ổ cứng cũ sẽ được di dời.
     - Khi bạn đã thêm ổ đích mới vào Volume Group và đảm bảo rằng ổ đích có đủ dung lượng trống để chứa dữ liệu từ ổ cứng cũ.

   - **Lệnh:**
     ```bash
     sudo pvmove /dev/sdX /dev/sdY
     ```

   - **Ví dụ sử dụng:**
     - Bạn muốn di dời dữ liệu từ ổ cứng cũ sang một ổ cứng mới (ổ đích) để thay thế ổ cứng cũ. Đây là trường hợp khi bạn cần đảm bảo dữ liệu được di dời sang một ổ cứng cụ thể.

   **Thêm ổ đích vào Volume Group:**
       ```bash
   sudo vgextend vg_cuongnv /dev/sdY
    ```
    
 ![Command Prompt](https://github.com/cuongnvvietis/NhanHoa/blob/main/Docs/Esxi/Picture/Add%20Storage/Screenshot_142.png)

- Giảm kích thước Logical Volume: Nếu có thể, giảm kích thước của Logical Volume để dữ liệu có thể vừa với ổ đích trong trường hợp ổ mới không đủ dung lượng với ổ thay thế. Sử dụng lvreduce để giảm kích thước Logical Volume:
    ```bash
    sudo lvreduce -L [kích thước] /dev/vg_cuongnv/lv_cuongnv
    
Chú ý: Trước khi giảm kích thước, hãy chắc chắn sao lưu dữ liệu quan trọng.

### Bước 6: Gỡ bỏ ổ cứng cũ khỏi Volume Group

    sudo vgreduce vg_name /dev/sdx  # Thay vg_name bằng tên Volume Group.
    
 ![Command Prompt](https://github.com/cuongnvvietis/NhanHoa/blob/main/Docs/Esxi/Picture/Add%20Storage/Screenshot_143.png) 

### Bước7. Kiểm tra lại
