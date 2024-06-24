# Set the variable value in *.tfvars file
# or using -var="do_token=..." CLI option
variable "do_token" {
    description = "DO TOKEN"
    type = string
    sensitive = true
}

variable "docker_host" {
    type = string
}

variable "docker_cert_path"{ 
    type = string
    sensitive = true
}

variable backend_version {
    type = string
    default = "v3.1"
}

variable database_version {
    type = string
    default = "v3"
}

variable backend_instance_count {
    type = number
    default = 3
}

#Better to create variables... dont modify it manually

#Region, Image

variable do_region {
    type = string
    default = "SGP1"
}

variable do_size {
    type = string
    default = "s-1vcpu-512mb-10gb"
}

variable do_image {
    type = string
    default = "ubuntu-20-04-x64"
}

variable do_ssh_key {
    type = string
    default = "www-1"
}

variable ssh_private_key {
    type = string
}