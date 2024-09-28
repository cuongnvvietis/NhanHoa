# Hướng dẫn kiểm tra hiệu năng giữa máy ảo định dạng RAW và QCOW2

## Mục tiêu
Hướng dẫn này sẽ giúp bạn kiểm tra và so sánh hiệu năng đọc/ghi giữa hai máy ảo có định dạng đĩa là **RAW** và **QCOW2**.

## Các công cụ cần thiết
- **fio**: Công cụ kiểm tra hiệu năng I/O mạnh mẽ.
- **dd**: Công cụ có sẵn trên Linux để kiểm tra hiệu năng đọc/ghi đơn giản.

## 1. Cài đặt `fio` trên các máy ảo
Trên Ubuntu/Debian
    sudo apt-get install fio
Trên CentOS/Fedora
    sudo yum install fio

## 2. Kiểm tra hiệu năng bằng fio
Ví dụ, kiểm tra với file 10GB và 4 luồng công việc:

    fio --name=test --ioengine=libaio --direct=1 --rw=readwrite --bs=4k --size=10G --numjobs=1 --group_reporting --filename=/tmp/testfile.img  ### Đọc ghi tuần tự
    fio --name=test --ioengine=libaio --direct=1 --rw=randrw --bs=4k --size=10G --numjobs=1 --group_reporting --filename=/tmp/testfile.img     ### Đọc ghi ngẫu nhiên

## 3. Phân tích kết quả
Sau khi chạy các bài kiểm tra, fio sẽ hiển thị các thông số như:

Tốc độ ghi (MB/s hoặc GB/s)
Tốc độ đọc (MB/s hoặc GB/s)
Độ trễ (latency)
Số lượng I/O operations per second (IOPS)
So sánh các thông số này giữa hai máy ảo để thấy được sự khác biệt về hiệu năng giữa định dạng RAW và QCOW2.

![Command Prompt](https://github.com/cuongnvvietis/NhanHoa/blob/main/Docs/Picture/KVM/Screenshot_23.png) 
![Command Prompt](https://github.com/cuongnvvietis/NhanHoa/blob/main/Docs/Picture/KVM/Screenshot_24.png) 
