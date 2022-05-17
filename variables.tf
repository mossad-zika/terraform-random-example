variable "webservers_count" {
  description = "Amount of webservers to run"
  type        = number
  default     = "2"
}

variable "nginx_docker_tag" {
  description = "Docker image taf for Nginx"
  type        = string
  default     = "1.21.6-alpine"
}

variable "js-webserver_docker_tag" {
  description = "Docker image tag for local js HTTP webserver"
  type        = string
  default     = "latest"
}