#This is hard coded
resource "digitalocean_droplet" "myapicdemo" {
  image  = "ubuntu-20-04-x64"
  name   = "myapipcdemo"
  region = "sgp1"
  size   = "s-1vcpu-1gb"
  ssh_keys = [
    "d5:00:b7:fc:96:8c:0e:7b:69:5a:4a:54:9d:af:e7:d8"
  ]

  connection {
    type        = "ssh"
    user        = "root"
    private_key = file("~/.ssh/id_ed25519")
    host        = self.ipv4_address
  }
}
