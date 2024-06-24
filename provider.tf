terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "3.0.2"
    }
    
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.0"
    }

    local = {
            source  = "hashicorp/local"
            version = "2.4.0"
        }

  }
}

provider "docker" {
  #host = "unix:///var/run/docker.sock" #Temporary placeholder
  host = "tcp://167.71.219.171:2376/" #Temporary #Certificate provider

  # -> specify either
  cert_path = pathexpand("~/.docker")
}

# Configure the DigitalOcean Provider
provider "digitalocean" {
  token = var.do_token
}