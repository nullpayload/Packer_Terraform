packer {
  required_plugins {
    proxmox = {
      version = ">= 1.2.1"
      source  = "github.com/hashicorp/proxmox"
    }
  }
}

source "proxmox-iso" "docker-template" {
  proxmox_url             = "https://10.0.0.11:8006/api2/json"
  node                    = var.proxmox_node
  username                = var.proxmox_username
  password                = var.proxmox_password
  communicator            = "ssh"
  ssh_username            = var.vm_username
  ssh_password            = var.vm_password
  ssh_timeout             = "30m"
  qemu_agent              = true
  cores                   = var.cores
  cpu_type                = var.cpu_type
  memory                  = var.mem
  vm_name                 = var.vm_name
  tags                    = var.tags
  template_description    = var.template_desc
  insecure_skip_tls_verify = true
  task_timeout            = "30m"
  http_directory          = "server"
  scsi_controller         = "virtio-scsi-single"
  boot_wait               = "10s"

  boot_iso {
    type             = "ide"
    iso_file          = "local:iso/ubuntu-22.04.4-live-server-amd64.iso"
    unmount          = true
    iso_checksum     = "sha256:45f873de9f8cb637345d6e66a583762730bbea30277ef7b32c9c3bd6700a32b2"
  }

  additional_iso_files {
    cd_files = [
      "./server/meta-data",
      "./server/user-data"
    ]
    cd_label         = "cidata"
    iso_storage_pool = "local"
    unmount          = true
  }

  network_adapters {
    bridge = var.network_bridge
  }

  disks {
    disk_size    = var.disk_size
    storage_pool = var.storage_name
    type         = "scsi"
    discard      = true
    io_thread    = true
    format       = "raw"
  }

  boot_command = [
    "<esc><esc><esc><esc>e<wait>",
    "<del><del><del><del><del><del><del><del>",
    "<del><del><del><del><del><del><del><del>",
    "<del><del><del><del><del><del><del><del>",
    "<del><del><del><del><del><del><del><del>",
    "<del><del><del><del><del><del><del><del>",
    "<del><del><del><del><del><del><del><del>",
    "<del><del><del><del><del><del><del><del>",
    "<del><del><del><del><del><del><del><del>",
    "<del><del><del><del><del><del><del><del>",
    "<del><del><del><del><del><del><del><del>",
    "<del><del><del><del><del><del><del><del>",
    "<del><del><del><del><del><del><del><del>",
    "<del><del><del><del><del><del><del><del>",
    "<del><del><del><del><del><del><del><del><del>",
    "linux /casper/vmlinuz --- autoinstall s=/cidata/<enter><wait>",
    "initrd /casper/initrd<enter><wait>",
    "boot<enter>",
    "<enter><f10><wait>"
  ]
}

build {
  sources = ["sources.proxmox-iso.docker-template"]


  provisioner "shell" {
    script = "scripts/install_docker.sh"
  }
}
