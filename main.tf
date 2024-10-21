terraform {
  required_providers {
    libvirt = {
        source = "local/hashicorp/libvirt"
        version = "0.8.0"
    }
  }
}

provider "libvirt" {
    uri = "qemu:///system"
}

resource "libvirt_pool" "vm1" {
  name = "vm1"
  type = "dir"
  path = "/home/artuhovich/terraform-provider-libvirt-pool-vm0"
}


resource "libvirt_volume" "vm1-qcow2" {
  name = "vm1.qcow2"
  pool   = libvirt_pool.vm0.name
  source = "/home/artuhovich/os_image/ubuntu20.04.qcow2"
  format = "qcow2"

}

resource "libvirt_domain" "vm2" {
  name = "vm2-ubuntu"
  memory = "2048"
  vcpu = "1"

  disk {
    volume_id = "${libvirt_volume.vm0-qcow2.id}"
  }

  network_interface {
    network_name = "default"
  }

  console {
    type = "pty"
    target_type = "serial"
    target_port = "0"
  }
}
