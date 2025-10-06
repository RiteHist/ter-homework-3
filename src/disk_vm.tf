resource "yandex_compute_disk" "storage_disk" {
    count = var.vm_disk_params[0].count
    size = var.vm_disk_params[0].size
    type = var.vm_disk_params[0].type
}

resource "yandex_compute_instance" "storage_vm" {
    name = "${var.vm_names[3]}"
    platform_id = var.generic_vm_resources[0].platform_id
    resources {
        cores = var.generic_vm_resources[0].cores
        memory = var.generic_vm_resources[0].memory
        core_fraction = var.generic_vm_resources[0].core_fraction
    }
    boot_disk {
        initialize_params {
            image_id = data.yandex_compute_image.ubuntu.image_id
        }
    }
    network_interface {
        subnet_id = yandex_vpc_subnet.develop.id
        nat = var.generic_vm_resources[0].nat
    }
    scheduling_policy {
        preemptible = var.generic_vm_resources[0].preemptible
    }
    metadata = local.vm_metadata_ssh
    dynamic "secondary_disk" {
        for_each = yandex_compute_disk.storage_disk[*]
        content {
            disk_id = secondary_disk.value.id
        }
    }
}