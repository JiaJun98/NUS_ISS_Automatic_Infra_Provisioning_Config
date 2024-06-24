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
}
