yc_cores	  = "2"
yc_memory	  = "2"
yc_disk_size  = "20"
yc_zone       = "ru-central1-a"

vms = {
    vm1 = {
        yc_imageid	= "fd81hgrcv6lsnkremf32"
        hostname    = "vm1-db-u"
        role        = "db"
    }
    vm2 = {
        yc_imageid	= "fd81hgrcv6lsnkremf32"
        hostname    = "vm2-app-u"
        role        = "app"
    }
    vm3 = {
        yc_imageid	= "fd83gkqdi2fkfifolia0"
        hostname    = "vm3-app-c"
        role        = "app"
    }
}
