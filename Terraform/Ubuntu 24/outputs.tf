output "vm_name" {
  description = "Output the name of the created VM"
  value = [for vm in proxmox_vm_qemu.my_vm : vm.name]
}
