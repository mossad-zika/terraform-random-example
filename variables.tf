variable "docker_network_name" {
  description = "Uniq name dor docker network"
  type        = string
  default     = "homeworknet"
}

variable "webserver_exposed_port_start_from" {
  description = "Port range start with to connect with web-server"
  type        = number
  default     = "8000"
}

variable "loadbalancer_exposed_port" {
  description = "Port to connect with load-balancer"
  type        = number
  default     = "7777"
}

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