variable "yc_token" {}
variable "yc_cloud_id" {}
variable "yc_zone" {}
variable "yc_folder_id" {}
variable "yc_cores" {}
variable "yc_memory" {}
variable "yc_disk_size" {}
variable "ssh_pub_ansible" {}
variable "ssh_pub_user" {}
variable "vm_count" {
  default = "1"
  description = "Number of vm"
  }
variable "vms" {
    type = map(object({
        hostname    = string
        role        = string
        os_family   = string
    }))
}