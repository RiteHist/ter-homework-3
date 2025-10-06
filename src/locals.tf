locals {
    ssh_pub_key = {"ssh-keys" = "ubuntu:${file(var.vms_ssh_root_key)}"}
    vm_metadata_ssh = merge(var.vm_metadata, local.ssh_pub_key)
}