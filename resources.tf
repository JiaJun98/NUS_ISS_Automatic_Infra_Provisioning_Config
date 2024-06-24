resource "docker_image" "bgg-database" {
    name = "chukmunnlee/bgg-database: ${var.database_version}"
}
resource "docker_image" "bgg-backend" {
    name = "chukmunnlee/bgg-backend: ${var.backend_version}"
}

resource "docker_network" "bgg-net" {
  name = "my-sgp-bgg-net"
}

resource "docker_volume" "data-vol" {
  name = "my-sgp-data-vol"
}

resource "docker_container" "bgg-database" {
  networks_advanced {
    name = docker_network.bgg-net.id
  }

  ports {
    internal = 3306
    external = 3306
  }

  volumes {
    volume_name = docker_volume.data-vol.name
    container_path = "/var/lib/mysql"
  }

}


resource "docker_container" "bgg-backend" {
    count = var.backend_instance_count
    name = "my-sgp-bgg-backend-${count.index}"
    image = docker_image.bgg-backend.image-id
    networks_advanced {
        name = docker_network.bgg-net.id
    }
    env = [
        "BGG_DB_USER=root",
        "BGG_DB_PASSWORD=changeit",
        "BGG_DB_HOST=${docker_container.bgg-database.name}"
    ]
    ports = {
        internal = 3000
    }
}

resource "digitalocean_droplet" "nginx" {
  name = "darryl-nginx"
  image = var.do_image
  region = var.do_region
  size = var.do_size

  ssh_keys = [ data.digitalocean_ssh_key.www-1.id]

  connection {
    type = "ssh"
    user = "root"
    private_key = file(var.ssh_private_key)
    host = self.ipv4_address
  }
}