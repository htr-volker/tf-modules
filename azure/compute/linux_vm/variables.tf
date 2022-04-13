# Required variables
variable "name" {
    description = "The name assigned to the VM and its NIC in the format '<name>-nic'."
}
variable "location" {
    description = "The region the VM will be spun up in."
}
variable "resource_group_name" {
    description = "The resource group the VM will belong to."
}
variable "subnet_id" {
    description = "The virtual subnet to which the NIC will be assigned."
}
variable "create_public_ip" {
    description = "When set to true, will assign a public IP address."
    type = bool
}

# Optional variables
variable "size" {
    description = "The virtual machine size. Defaults to Standard_B1ms (1 vCPU, 1GB vRAM)."
    default = "Standard_B1ms"
}
variable "admin_username" {
    description = "The username of the admin user for the VM. Defaults to 'azureuser'."
    default = "azureuser"
}
variable "ssh_public_key" {
    description = "The path to the SSH public key assigned to the admin user to allow SSH connection. Defaults to '~/.ssh/id_rsa.pub'."
    default = "~/.ssh/id_rsa.pub"
}
variable "os_disk_type" {
    description = "The type of disk attached to this VM. Defaults to 'Standard_LRS'."
    default = "Standard_LRS"
}
variable "image_publisher" {
    description = "The publisher for the Linux distro image installed on the OS disk. Defaults to 'Canonical'."
    default = "Canonical"
}
variable "image_offer" {
    description = "The offer type for the Linux distro. Defaults to 'UbuntuServer'."
    default = "UbuntuServer"
}
variable "image_sku" {
    description = "The SKU for the image, defining the version number of the distro. Defaults to '20.04-LTS'"
    default = "20.04-LTS"
}
variable "image_version" {
    description = "The image version number. Defaults to 'latest'."
    default = "latest"
}
