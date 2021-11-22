resource "yandex_compute_instance" "vm" {
  for_each        = var.vms
  name            = each.value.hostname
  preemptible     = true
  resources {
    cores         = var.yc_cores
    memory        = var.yc_memory
    core_fraction = 20
  }
  labels = {
    ansible-group = each.value.role
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.my_image[each.key].id
      size     = var.yc_disk_size
    }
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.subnet-1.id
    nat       = true
  }
  metadata = {
    user-data   = templatefile("userdata.tpl", {
      ssh_key_user    = var.ssh_pub_user
      ssh_key_ansible = var.ssh_pub_ansible
    })
  }
  connection {
    host        = self.network_interface[0].nat_ip_address
    type        = "ssh"
    user        = "seruff"
    private_key = file("~/.ssh/id_rsa")
  }

  provisioner "remote-exec" {
  inline = ["sudo hostnamectl set-hostname ${each.value.hostname}"]
  }
}

