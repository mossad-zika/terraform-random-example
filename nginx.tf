locals {
  module_path     = abspath(path.module)
  webserver_range = range(0, var.webservers_count)
}

resource "local_file" "upstream" {
  content     = templatefile("./upstream.tftpl", {
    hosts = local.webserver_range
  })
  filename = "./upstream.conf"
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
    host_path =  "${local.module_path}/upstream.conf"
    read_only = true
  }
}