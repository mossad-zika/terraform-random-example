terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
      version = "~> 2.13.0"
    }
  }
}

provider "docker" {}

resource "docker_image" "httpecho" {
  name         = "hashicorp/http-echo:0.2.3"
  keep_locally = false
}

resource "docker_container" "httpecho" {
  count = var.webservers_count
  image = docker_image.httpecho.latest
  name  = "webserver${count.index}"
  command = ["-text=Hello from web-server ${count.index}"]
  ports {
    internal = 5678
    external = 8000 + count.index
  }
}