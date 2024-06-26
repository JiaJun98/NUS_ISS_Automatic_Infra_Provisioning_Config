variable do_token {
  type = string
  description = "DigitalOcean API token"
  sensitive = true
}

variable do_region {
    type = string
    description = "DigitalOcean region"
    default = "sgp1"
}

variable do_image {
    type = string
    description = "DigitalOcean image"
    default = "ubuntu-24-04-x64"
}

variable do_size {
    type = string
    description = "DigitalOcean size"
    default = "s-1vcpu-1gb"
}
