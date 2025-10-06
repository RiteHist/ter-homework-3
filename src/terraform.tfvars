generic_vm_resources = [ {
    cores = 2
    memory = 1
    core_fraction = 20
    preemptible = true
    platform_id = "standard-v4a"
    nat = true
} ]
vm_metadata = {
  "serial-port-enable" = "1"
}
each_vm = [
    {
        vm_name = "main"
        cores = 4
        memory = 2
        core_fraction = 50
        preemptible = true
        platform_id = "standard-v2"
        nat = true
        disk_volume = 10
    },
    {
        vm_name = "replica"
        cores = 2
        memory = 1
        core_fraction = 20
        preemptible = true
        platform_id = "standard-v4a"
        nat = true
        disk_volume = 15
    }
]
vm_disk_params = [ {
    count = 3
    size = 1
    type = "network-hdd"
} ]