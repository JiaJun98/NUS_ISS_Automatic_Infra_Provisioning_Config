output "droplet_public_ip" {
  value = digitalocean_droplet.myapicdemo.ipv4_address
}