resource "docker_container" "httpecho" {
  count = var.webservers_count
  image = docker_image.httpecho.name
  networks_advanced {
    name    = docker_network.homeworknet.name
    aliases = ["webserver${count.index}"]
  }
  name  = "webserver${count.index}"
  command = ["-text=Hello from web-server ${count.index}"]
#  ports {
#    internal = 5678
#    external = 8000 + count.index
#  }
}