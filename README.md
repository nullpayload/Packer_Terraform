# Packer_Terraform
Proxmox - Packer and Terraform for template creation and deployments

## Packer

   Creates a Proxmox VM Template based on Ubuntu 22.04.4 named template-docker, with a tag of 'template'  
   ISO lives in a Proxmox storage location named 'local'.  
   VM boots to ISO, runs cloud-init, Subiquity for local disk paritioning, user Ubuntu and pass created, proxmox agent install, sets hostname, adds ubuntu user to wheel.   
   After rebooting, shell provisioner runs (/scripts/install_docker.sh) to run apt update and upgrade, add docker repo to apt list, install docker, add docker group, set docker to run at startup.  
   VM is then shutdown, and converted to a template.  

## Terraform
   Uses the above mentioned template named 'template-docker' to create X number of VMs.    
   The number of VMs created is controlled by the Count in variables.tf line 17.  I've set the default value to 5.    
   VMs are linked clones, as set in line 24 of main.tf by 'full_clone	= false'.   Set this bool value to true, to create full clones.    
   VMs are named 'test-vm-X' with X being an incremented number starting at 1, and increments based on the Count value.    
   VM storage is in a Proxmox storage location named 'local'.  

## Issues
   local pam login is used to authenticate to the proxmox API.  I think I hit this issue with Packer, but didn't go back to this after switching to local pam auth. https://bugzilla.proxmox.com/show_bug.cgi?id=4344  
    
## Todo
   Update to Ubuntu 24  
    
