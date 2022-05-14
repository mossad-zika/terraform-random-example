terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
      version = "~> 2.13.0"
    }
  }
}

provider "docker" {}

resource "docker_network" "homeworknet" {
  name   = "homeworknet"
  driver = "bridge"
}

resource "docker_image" "httpecho" {
  name         = "hashicorp/http-echo:0.2.3"
  keep_locally = false
}

resource "docker_image" "nginx" {
  name = "nginx:1.21.6-alpine"
  keep_locally = false
}

