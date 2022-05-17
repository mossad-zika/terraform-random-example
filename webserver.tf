resource "docker_image" "js-simple-http-server" {
  name = "zoo"
  build {
    path = "./js-simple-http-server"
    tag  = ["webserver:${var.js-webserver_docker_tag}"]
  }
}


resource "docker_container" "js-webserver" {
  depends_on = [docker_image.js-simple-http-server]
  count = var.webservers_count
  image = docker_image.js-webserver.name
  networks_advanced {
    name    = docker_network.homeworknet.name
    aliases = ["webserver${count.index}"]
  }
  name  = "webserver${count.index}"
  env = ["WEBSERVER_ID=${count.index}"]
#  command = ["-text=Hello from web-server ${count.index}"]
  ports {
    internal = 5678
    external = var.webserver_exposed_port_start_from + count.index
  }
}