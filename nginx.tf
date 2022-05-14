resource "docker_container" "nginx-server" {
  name = "nginx-loadbalancer"
  image = docker_image.nginx.latest
  ports {
    internal = 80
    external = 7777
  }
#  volumes {
#    container_path  = "/usr/share/nginx/html"
#    host_path = "/tmp/tutorial/www"
#    read_only = true
#  }
}