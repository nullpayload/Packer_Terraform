variable "proxmox_node" {
  description = "Proxmox node name to create VM for template"
  type        = string
  default     = "pve"
}

variable "proxmox_username" {
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

variable "vm_username" {
  description = "Username for VM template"
  type        = string
  default     = "ubuntu"
}

variable "cpu_type" {
  description = "VM CPU type"
  type		    = string
  default	    = "host"

}
variable "vm_password" {
  description = "Password for VM template username"
  type        = string
  default     = "ubuntu"
  sensitive   = true
}

variable "vm_name" {
  description = "Name for the created VM template"
  type        = string
  default     = "template-docker"
}

variable "cores" {
  description = "CPU cores to assign to VM"
  type        = number
  default     = 2
}

variable "mem" {
  description = "Memory, in MB, to assign VM"
  type        = number
  default     = 8192
}

variable "tags" {
  description = "Tags to give template"
  type		    = string
  default	    = "template"
}

variable "template_desc" { 
  description	= "Description for Template"
  type		    = string
  default	    = "Ubuntu 22.04 Docker Template"
}

variable "network_bridge" {
  description = "Network bridge for VM"
  type        = string
  default     = "vmbr0"
}

variable "disk_size" {
  description = "VM disk size -NEED TO INCLUDE UNIT SUFFIX like 10G, 2T, etc"
  type        = string
  default     = "20G"
}

variable "storage_name" {
  description = "Proxmox destination storage for VM Template"
  type        = string
  default     = "sata-thin"
}

