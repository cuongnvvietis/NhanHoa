# Hướng Dẫn Chi Tiết Mở Rộng Phân Vùng `/` Cho Máy Ảo KVM

## Giới Thiệu
Trong bài viết này, chúng ta sẽ thực hiện từng bước chi tiết để mở rộng phân vùng `/` của máy ảo KVM khi phân vùng bị đầy. Các bước bao gồm mở rộng ổ đĩa ảo (`qcow2` hoặc `raw`), mở rộng phân vùng vật lý bằng `fdisk`, cập nhật `LVM` để nhận diện không gian mới (`pvresize`), và cuối cùng là mở rộng hệ thống tập tin (`xfs_growfs` hoặc `resize2fs`).

### Yêu Cầu Trước Khi Thực Hiện
- Máy ảo sử dụng hệ điều hành Linux với phân vùng được quản lý bằng LVM.
- **⚠️ Cảnh báo**: **Sao lưu tất cả dữ liệu quan trọng trước khi thực hiện bất kỳ thao tác nào liên quan đến phân vùng và ổ đĩa**.

---

## Bước 1: Mở Rộng Ổ Đĩa Ảo

Đầu tiên, bạn cần tắt máy ảo sau đó, bạn cần mở rộng dung lượng ổ đĩa ảo của máy ảo KVM:

      qemu-img resize /var/lib/libvirt/images/amalinix.raw +20G
![Command Prompt](https://github.com/cuongnvvietis/NhanHoa/blob/main/Docs/Picture/KVM/Screenshot_25.png)
- **Chú ý**: Sử dụng tùy chọn `-f raw` để đảm bảo `qemu-img` hiểu định dạng ổ đĩa.
- **Cảnh báo**: **⚠️** Đảm bảo rằng máy ảo đang tắt trước khi thực hiện lệnh này để tránh gây ra lỗi không mong muốn.

## Bước 2: Mở Rộng Phân Vùng Vật Lý Bằng `fdisk`

1. **Khởi Động Máy Ảo**:

   Khởi động lại máy ảo để thực hiện thay đổi phân vùng bên trong.

       virsh start <vm_name>

2. **Mở Công Cụ `fdisk` Cho Ổ Đĩa `vda`**:

   fdisk /dev/vda

   - **Xóa Phân Vùng Cũ**:
     - Nhập `d` và chọn phân vùng **số `2`** (`/dev/vda2`).
     - **⚠️ Cảnh báo**: **Chỉ xóa phân vùng `vda2`**, đảm bảo không xóa nhầm phân vùng `vda1` vì nó chứa `/boot`.
   - **Tạo Lại Phân Vùng**:
     - Nhập `n` để tạo phân vùng mới.
     - **Chọn `p`** để tạo phân vùng **primary**.
     - **Giữ nguyên điểm bắt đầu của phân vùng** (thường `fdisk` sẽ đề xuất điểm bắt đầu cũ) để tránh mất dữ liệu.
     - **Chọn sử dụng toàn bộ không gian còn lại** của ổ đĩa cho phân vùng mới.
   - **Thông Báo Về Chữ Ký LVM**:
     - **⚠️Nhập `n`** để **không xóa chữ ký** LVM. Điều này rất quan trọng để bảo toàn dữ liệu LVM hiện có. Nếu xóa chữ ký này, Volume Group và Logical Volume có thể không nhận diện được và dẫn đến mất dữ liệu.
   Sau khi tạo lại phân vùng, bạn sẽ nhận được thông báo sau:
   - **Thay Đổi Loại Phân Vùng**:
     - Nhấn `t` để thay đổi loại phân vùng.
     - Nhập `8e` để thay đổi loại thành **Linux LVM**.
   - **Ghi Lại Thay Đổi**:
     - Nhấn `w` để ghi lại thay đổi và thoát khỏi `fdisk`.
![Command Prompt](https://github.com/cuongnvvietis/NhanHoa/blob/main/Docs/Picture/KVM/Screenshot_26.png)
## Bước 3: Cập Nhật Physical Volume (`pvresize`)

Sau khi tạo lại phân vùng, cập nhật `Physical Volume` để nhận diện không gian mở rộng:

pvresize /dev/vda2

- **Chú ý**: Lệnh này sẽ cập nhật thông tin của `Physical Volume` để sử dụng toàn bộ không gian mới từ phân vùng `vda2`.
![Command Prompt](https://github.com/cuongnvvietis/NhanHoa/blob/main/Docs/Picture/KVM/Screenshot_28.png)
## Bước 4: Mở Rộng Logical Volume (`lvextend`)

Tiếp theo, mở rộng `Logical Volume` để sử dụng không gian vừa mở rộng:

lvextend -l +100%FREE /dev/almalinux/root

- **Chú ý**: Lệnh này sẽ mở rộng `Logical Volume` (`/dev/almalinux/root`) để sử dụng toàn bộ không gian còn lại của `Volume Group`.

## Bước 5: Mở Rộng Hệ Thống Tập Tin

1. **Nếu Sử Dụng Hệ Thống Tập Tin `xfs`**:

   Mở rộng hệ thống tập tin bằng lệnh:

   xfs_growfs /
![Command Prompt](https://github.com/cuongnvvietis/NhanHoa/blob/main/Docs/Picture/KVM/Screenshot_28.png)
2. **Nếu Sử Dụng Hệ Thống Tập Tin `ext4`**:

   Mở rộng hệ thống tập tin bằng lệnh:

   resize2fs /dev/almalinux/root

## Bước 6: Kiểm Tra Kết Quả

Kiểm tra lại dung lượng của phân vùng root (`/`) để đảm bảo phân vùng đã được mở rộng thành công:

df -h

Lệnh này sẽ hiển thị kích thước hiện tại của các phân vùng và xác nhận rằng phân vùng root (`/`) đã được mở rộng và có thêm dung lượng.

![Command Prompt](https://github.com/cuongnvvietis/NhanHoa/blob/main/Docs/Picture/KVM/Screenshot_29.png)

## ⚠️ Cảnh Báo Quan Trọng

- **Sao Lưu Dữ Liệu**: Trước khi thay đổi phân vùng và LVM, luôn thực hiện sao lưu dữ liệu để tránh mất dữ liệu không mong muốn.
- **Thao Tác Với `fdisk`**: Xóa và tạo lại phân vùng có thể gây mất dữ liệu nếu không thực hiện chính xác. **Hãy đảm bảo rằng điểm bắt đầu của phân vùng giữ nguyên**.
- **Không Xóa Chữ Ký LVM**: Khi được hỏi về việc xóa chữ ký LVM, luôn nhập **`n`** để giữ lại chữ ký này, vì xóa nó có thể làm mất khả năng nhận diện `Volume Group` và `Logical Volume`.

---

## Kết Luận

Bài viết này hướng dẫn chi tiết cách mở rộng phân vùng root (`/`) cho máy ảo KVM khi dung lượng bị đầy. Các bước bao gồm từ việc mở rộng ổ đĩa ảo, sử dụng `fdisk` để mở rộng phân vùng vật lý, cập nhật `LVM`, và cuối cùng mở rộng hệ thống tập tin để tận dụng không gian mới.

Nếu bạn gặp phải bất kỳ vấn đề nào hoặc cần thêm hỗ trợ, hãy để lại bình luận bên dưới bài viết để mọi người cùng hỗ trợ.
