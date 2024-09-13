# Hướng dẫn tạo và chia phân vùng ổ đĩa với `fdisk`

Trong hướng dẫn này, bạn sẽ học cách chia một ổ đĩa (ví dụ `/dev/sdd`) thành bốn phân vùng riêng biệt (`sdd1`, `sdd2`, `sdd3`, và `sdd4`) bằng công cụ `fdisk` trên Linux.

# Bước 1: Kiểm tra các phân vùng hiện tại

Trước khi bắt đầu chia phân vùng, bạn cần kiểm tra ổ đĩa để biết tình trạng các phân vùng hiện có:

    sudo fdisk -l /dev/sdd
    
Lệnh này sẽ hiển thị danh sách các phân vùng trên ổ đĩa /dev/sdd.

# Bước 2: Xóa các phân vùng hiện có (nếu cần)

Nếu ổ đĩa đã có các phân vùng và bạn muốn xóa chúng trước khi tạo phân vùng mới, bạn có thể làm theo các bước sau:

Mở fdisk:

    sudo fdisk /dev/sdd

Nhấn d để xóa từng phân vùng. Lặp lại cho đến khi tất cả các phân vùng đã bị xóa.
Sau khi xóa các phân vùng, kiểm tra lại để chắc chắn ổ đĩa trống:
Command (m for help): p

# Bước 3: Tạo các phân vùng mới

Tạo phân vùng sdd1 với 5GB:
Trong giao diện fdisk, nhấn n để tạo một phân vùng mới.
Chọn p để tạo một phân vùng chính.
Nhập 1 để tạo phân vùng số 1.
Để mặc định sector bắt đầu (thường là 2048), rồi nhập kích thước +5G cho phân vùng này.
Nhấn p để kiểm tra phân vùng đã được tạo.

Tương tự như các phân vùng 2,3,4

# Bước 4: Ghi thay đổi và thoát

Sau khi tạo các phân vùng mong muốn, nhấn w để ghi các thay đổi và thoát khỏi fdisk.
Command (m for help): w

# Bước 5: Định dạng các phân vùng

Để định dạng các phân vùng mới tạo, sử dụng lệnh mkfs để tạo hệ thống tệp. Ví dụ, sử dụng ext4 cho từng phân vùng:

    sudo mkfs.ext4 /dev/sdd1
    sudo mkfs.ext4 /dev/sdd2
    sudo mkfs.ext4 /dev/sdd3
    sudo mkfs.ext4 /dev/sdd4

# Bước 6: Mount các phân vùng
Cuối cùng, mount từng phân vùng vào hệ thống để sử dụng:

    sudo mkdir /mnt/sdd1 /mnt/sdd2 /mnt/sdd3 /mnt/sdd4
    sudo mount /dev/sdd1 /mnt/sdd1
    sudo mount /dev/sdd2 /mnt/sdd2
    sudo mount /dev/sdd3 /mnt/sdd3
    sudo mount /dev/sdd4 /mnt/sdd4

Kiểm tra bằng lệnh df -h để đảm bảo các phân vùng đã được mount thành công.

    df -h
