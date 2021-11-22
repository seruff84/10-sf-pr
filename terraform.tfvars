yc_cores	  = "2"
yc_memory	  = "2"
yc_disk_size  = "20"
yc_zone       = "ru-central1-a"

vms = {
    vm1 = {
        hostname    = "vm1-db-u"
        role        = "db"
        os_family	= "ubuntu-2004-lts"
    }
    vm2 = {
        hostname    = "vm2-app-u"
        role        = "app"
        os_family	= "ubuntu-2004-lts"
    }
    vm3 = {
        hostname    = "vm3-app-c"
        role        = "app"
        os_family	= "centos-8"
    }
}
