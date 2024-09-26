    virsh domjobinfo <vm-name>
    virsh domblklist ubuntu20.04


virt-install \
  --name amalinix \
  --ram 2048 \
  --vcpus 2 \
  --disk path=/var/lib/libvirt/images/amalinix.raw,size=20,bus=virtio,format=raw \
  --os-variant generic \
  --network bridge=br-vlan10 \
  --location /home/it/iso/AlmaLinux-8.9-x86_64-minimal.iso \
  --graphics vnc \
  --console pty,target_type=serial

qemu-img create -f raw /var/lib/libvirt/images/amalinix.raw 20G
