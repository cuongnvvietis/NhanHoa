# Hướng dẫn xử lý và xóa volumes trong OpenStack

## **Tóm tắt các bước**

### **1. Ngắt kết nối volumes khỏi instances**
Dùng lệnh sau để ngắt kết nối tất cả volumes:

```bash
for volume in VOLUME_ID_LIST
  do
    echo "Detaching volume $volume..."
    openstack volume set --detach $volume
  done
```

### **2. Đặt trạng thái volumes về `available`**
Sau khi ngắt kết nối, cập nhật trạng thái của volumes:

```bash
for volume in VOLUME_ID_LIST
  do
    echo "Setting volume $volume to available..."
    openstack volume set --state available $volume
  done
```

### **3. Xóa tất cả volumes**
Dùng lệnh xóa hàng loạt với tùy chọn cưỡng chế:

```bash
for volume in VOLUME_ID_LIST
  do
    echo "Deleting volume $volume..."
    openstack volume delete --force $volume
  done
```

### **4. Kiểm tra lại**
Sau khi xóa, kiểm tra danh sách volumes để đảm bảo tất cả đã bị xóa:

```bash
openstack volume list
```

---

## **Danh sách `VOLUME_ID_LIST`**
Thay `VOLUME_ID_LIST` bằng danh sách ID volumes của bạn:

```bash
for volume in 17322a98-49fc-4efa-a0a2-42823db6551d \
             fbe4f15b-281e-4978-8390-8b204aa247a9 \
          
             e9d63664-c506-49a9-b6b9-4c2b5e5a29e4 \
             5af044ac-f104-4ad0-9c56-f6b87cbdc90c
  do
    echo "Processing volume $volume..."
  done


#cloud-config
chpasswd:
  list: |
    username:123456a@
  expire: False
ssh_pwauth: True
```
