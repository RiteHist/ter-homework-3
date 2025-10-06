resource "yandex_compute_instance" "for_each_vm" {
    for_each = { for i, vm in var.each_vm : vm.vm_name => vm }
    platform_id = each.value.platform_id
    name = each.value.vm_name
    resources {
        cores = each.value.cores
        memory = each.value.memory
        core_fraction = each.value.core_fraction
    }
    boot_disk {
        initialize_params {
            image_id = data.yandex_compute_image.ubuntu.image_id
            size = each.value.disk_volume
        }
    }
    network_interface {
        subnet_id = yandex_vpc_subnet.develop.id
        nat = each.value.nat
    }
    scheduling_policy {
        preemptible = each.value.preemptible
    }

    metadata = local.vm_metadata_ssh
}