terraform {
    required_providers {
        docker = {
            source  = "kreuzwerker/docker"
            version = "3.0.2"
        }

        digitalocean = {
            source  = "digitalocean/digitalocean"
            version = "2.26.0"
        }

        local = {
            source  = "hashicorp/local"
            version = "2.4.0"
        }
    }
}

provider "docker" {
    host = "tcp://${var.docker_host}:2376" #Temporary
    cert_path = var.docker_cert_path #Certificate provider
} 


# Configure the DigitalOcean Provider
provider "digitalocean" {
    token = var.do_token
}

provider local { }