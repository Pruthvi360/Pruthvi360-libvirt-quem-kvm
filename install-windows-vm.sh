#!/bin/bash

#qemu-img create -f qcow2 /var/lib/libvirt/images/csr_3_13_03_disk.qcow2 8G
virt-install               \
      --connect=qemu:///system  \
      --name=windows_10          \
      --description "Windows 10 VM "   \
      --os-type=windows           \
      --arch=x86_64             \
      --cpu host                \
      --vcpus=4,sockets=2,cores=4,threads=1   \
      --hvm                     \
      --ram=4096                \
      --cdrom=/var/images/Win10_1809Oct_v2_English_x64.iso \
      --disk path=/var/images/windows10.qcow2,bus=virtio,size=8,sparse=false,cache=none,format=qcow2   \
      --graphics vnc            \
      --network bridge=virbr0,model=virtio    
