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

### Bước 4: Thêm ổ cứng mới vào Volume Group

    sudo vgextend vg_name /dev/sdX  # Thay vg_name bằng tên Volume Group và sdX bằng tên ổ cứng mới.  
    
 ![Command Prompt](https://github.com/cuongnvvietis/NhanHoa/blob/main/Docs/Esxi/Picture/Add%20Storage/Screenshot_141.png)
 
### Bước 5: Di dời dữ liệu từ ổ cứng cũ (nếu cần)
    Nếu ổ cứng cũ là một phần của Volume Group, bạn cần phải di dời dữ liệu ra khỏi nó trước khi thay thế. Sử dụng pvmove để di chuyển dữ liệu:

    sudo pvmove /dev/sdX  # Thay sdX bằng tên ổ cứng cũ.
    
 ![Command Prompt](https://github.com/cuongnvvietis/NhanHoa/blob/main/Docs/Esxi/Picture/Add%20Storage/Screenshot_142.png)
 
### Bước 6: Gỡ bỏ ổ cứng cũ khỏi Volume Group

    sudo vgreduce vg_name /dev/sdx  # Thay vg_name bằng tên Volume Group.
    
 ![Command Prompt](https://github.com/cuongnvvietis/NhanHoa/blob/main/Docs/Esxi/Picture/Add%20Storage/Screenshot_143.png) 

### Bước7. Kiểm tra lại
