#!/bin/bash

function start_cluster() {
  terraform apply
}

function stop_cluster() {
    terraform destroy
}

function status_cluster() {

    if curl -s localhost:7777/health; then
        echo "load balancer is healthy, cluster status GREEN"
    else
        echo "load balancer is unhealthy, cluster status RED"
    fi
}

function second_cluster() {
   echo "This one is not ready yet :("
}

case "$1" in
    start_cluster)   start_cluster ;;
    stop_cluster)    stop_cluster ;;
    status_cluster) status_cluster ;;
    bonus) second_cluster ;;
    *) echo "usage: $0 start_cluster|stop_cluster|status_cluster|bonus" >&2
       exit 1
       ;;
esac