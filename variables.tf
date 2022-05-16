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

variable "http-echo_docker_tag" {
  description = "Docker image tag for Hashicorp http-echo"
  type        = string
  default     = "0.2.3"
}