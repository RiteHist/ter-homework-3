variable "cloud_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}

variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}
variable "default_cidr" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vpc_name" {
  type        = string
  default     = "develop"
  description = "VPC network&subnet name"
}

variable "vm_count" {
  type = number
  default = 2
  description = "Number of VMs to create using count"
}

variable "vm_names" {
  type = list(string)
  default = ["web", "main", "replica", "storage"]
}

variable "generic_vm_resources" {
  type = list(object({
    cores = number
    memory = number
    core_fraction = number
    preemptible = bool
    platform_id = string
    nat = bool
  }))
}

variable "image_family" {
  type = string
  default = "ubuntu-2004-lts"
}

variable "vms_ssh_root_key" {
  type        = string
  default     = "~/.ssh/id_ed25519.pub"
  description = "ssh-keygen -t ed25519"
}

variable "vm_metadata" {
    type = map(string)
}

variable "each_vm" {
  type = list(object({
    vm_name = string
    cores = number
    memory = number
    core_fraction = number
    preemptible = bool
    platform_id = string
    nat = bool
    disk_volume = number
  }))
}

variable "vm_disk_params" {
  type = list(object({
    count = number
    size = number
    type = string
  }))
}