variable "proxmox_user" {
  description = "Proxmox username - username@pam for local pam auth"
  type        = string
  default     = "root@pam"
}

variable "proxmox_password" {
  description = "Proxmox pam password"
  type        = string
  sensitive   = true
  default     = "passwordz1"
}

variable "vm_count" {
  description = "Number of VMs to create"
  type        = number
  default     = 5
}

variable "vm_name" {
  description = "Name for the created VM"
  type        = string
  default     = "test-vm"
}

variable "proxmox_node" {
  description = "Proxmox node name where the VM will be created"
  type        = string
  default     = "pve"  
}

variable "clone" {
  description = "Name of the template to clone the new VM from"
  type        = string
  default     = "template-docker"
}

variable "cores" {
  description = "CPU cores to assign to VM"
  type        = number
  default     = 2
}

variable "mem" {
  description = "Memory in MB to assign VM"
  type        = number
  default     = 2048
}

variable "storage_name" {
  description = "Proxmox destination storage for the VM disk"
  type        = string
  default     = "Data"
}

variable "disk_size" {
  description = "VM disk in GB"
  type        = number
  default     = 20
}

variable "disk_backup" {
  description = "Include this disk in VM backups?"
  type        = bool
  default     = false
}

variable "network_bridge" {
  description = "Network bridge for VM"
  type        = string
  default     = "vmbr0"
}

variable "network_firewall" {
  description = "Enable firewall on this VM?"
  type        = bool
  default     = false
}

variable "network_model" {
  description = "Network card model to create"
  type        = string
  default     = "virtio"
}
