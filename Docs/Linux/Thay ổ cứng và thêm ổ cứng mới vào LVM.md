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

### Bước 5: Giả lập thư mục /cuongnv sử dụng full disk bằng lệnh: 

    dd if=/dev/zero of=/cuongnv/tenfile bs=1G count=5

 ![Command Prompt](https://github.com/cuongnvvietis/NhanHoa/blob/main/Docs/Esxi/Picture/Disk/Screenshot_48.png)

### Bước 6: Di dời dữ liệu từ ổ cứng cũ
    
   sudo pvmove /dev/sdb /dev/sdd (Move toàn bộ dữ liệu sang PV đích)
   sudo pvmove /dev/sdb (Move toàn bộ dữ liệu trên PV khác)
    
 ![Command Prompt](https://github.com/cuongnvvietis/NhanHoa/blob/main/Docs/Esxi/Picture/Disk/Screenshot_49.png)

 ### Bước 7: Gỡ bỏ ổ cứng cũ khỏi Volume Group
         vgreduce vg_cuongnv /dev/sdb
 ![Command Prompt](https://github.com/cuongnvvietis/NhanHoa/blob/main/Docs/Esxi/Picture/Disk/Screenshot_50.png)        
### Bước 8: Mở rộng phân vùng lv bằng lệnh sau:
        lvextend -l +100%FREE /dev/vg_cuongnv/lv_cuongnv
 ![Command Prompt](https://github.com/cuongnvvietis/NhanHoa/blob/main/Docs/Esxi/Picture/Disk/Screenshot_52.png)
### Bước 9: Thay đổi kích thước của filesystem trên một logical volume và Kiểm tra lại bằng lệnh df-h
        resize2fs /dev/mapper/vg_cuongnv/lv_cuongnv
 ![Command Prompt](https://github.com/cuongnvvietis/NhanHoa/blob/main/Docs/Esxi/Picture/Disk/Screenshot_53.png)

 
- Giảm kích thước Logical Volume: Nếu có thể, giảm kích thước của Logical Volume để dữ liệu có thể vừa với ổ đích trong trường hợp ổ mới không đủ dung lượng với ổ thay thế. Sử dụng lvreduce để giảm kích thước Logical Volume:
    ```bash
    sudo lvreduce -L [kích thước] /dev/vg_cuongnv/lv_cuongnv
    
Chú ý: Trước khi giảm kích thước, hãy chắc chắn sao lưu dữ liệu quan trọng.



