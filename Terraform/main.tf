terraform {
  required_providers {
    proxmox = {
      source = "Telmate/proxmox"
      version = "3.0.1-rc6"
    }
  }
}

provider "proxmox" {
 pm_api_url		= "https://10.0.0.11:8006/api2/json"
 pm_user		= var.proxmox_user
 pm_password		= var.proxmox_password
 pm_tls_insecure	= true
}

resource "proxmox_vm_qemu" "my_vm" {
 count		= var.vm_count
 name		= "${var.vm_name}-${count.index + 1}"
 target_node	= var.proxmox_node
 clone		= var.clone
 cores		= var.cores
 memory		= var.mem
 full_clone	= false
 network {
     id		= 0
     bridge	= var.network_bridge
     firewall	= var.network_firewall
     model	= var.network_model
 }
 disks {
    scsi {
       scsi0 {
           disk {
	            storage	= var.storage_name
	            size	= var.disk_size
              backup	= var.disk_backup
	          }
       }
    }
  }
}

