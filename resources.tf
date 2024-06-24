resource "docker_image" "bgg-database" {
    name = "chukmunnlee/bgg-database: ${var.database_version}"
}
resource "docker_image" "bgg-backend" {
    name = "chukmunnlee/bgg-backend: ${var.backend_version}"
}