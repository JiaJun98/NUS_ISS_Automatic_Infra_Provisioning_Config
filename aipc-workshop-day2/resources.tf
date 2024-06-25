data "digitalocean_ssh_key" "aipc" {
  name = var.do_ssh_key
}

resource "digitalocean_droplet" "codeserver" {
  name = "codeserver"
  image = var.do_image
  region = var.do_region
  size = var.do_size

  ssh_keys = [data.digitalocean_ssh_key.aipc.id] #Dont use fingerprint normally it wont resolve the id one
}

resource "local_file" "inventory" {
  content = templatefile("inventory.yaml.tftpl", {
        codeserver_ip = digitalocean_droplet.codeserver.ipv4_address
        ssh_private_key = var.ssh_private_key
        codeserver_password = var.codeserver_password
        codeserver_domain = "code-server-${digitalocean_droplet.codeserver.ipv4_address}.example.com" #Any domain will do
  })

  filename = "inventory.yml"
  file_permission = "0444" 
}