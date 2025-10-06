resource "local_file" "hosts_templatefile" {
    content = templatefile("${path.module}/hosts.tftpl", 
    {
        webservers = yandex_compute_instance.vm_web,
        databases = yandex_compute_instance.for_each_vm
        storage =[yandex_compute_instance.storage_vm]
    })

    filename = "${abspath(path.module)}/hosts.ini"
}