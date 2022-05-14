locals {
  module_path        = abspath(path.module)
}

resource "docker_container" "nginx-server" {
  name = "nginx-loadbalancer"
  image = docker_image.nginx.name
  networks_advanced {
    name    = docker_network.homeworknet.name
    aliases = ["loadbalancer"]
  }
  ports {
    internal = 80
    external = 7777
  }
  volumes {
    container_path  = "/etc/nginx/conf.d/default.conf"
    host_path = "/home/zika/terraform-homework/upstream.conf"
    read_only = true
  }
}