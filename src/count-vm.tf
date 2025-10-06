resource "yandex_compute_instance" "vm_web" {
    count = var.vm_count
    platform_id = var.generic_vm_resources[0].platform_id 
    name = "${var.vm_names[0]}-${count.index + 1}"
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
    scheduling_policy {
        preemptible = var.generic_vm_resources[0].preemptible
    }
    network_interface {
        subnet_id = yandex_vpc_subnet.develop.id
        nat = var.generic_vm_resources[0].nat
        security_group_ids = toset([yandex_vpc_security_group.example.id])
    }
    metadata = local.vm_metadata_ssh
    depends_on = [yandex_compute_instance.for_each_vm]
}