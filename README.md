Prepare:
```
# make sure you have curl and docker installed
# install terraform (you can use simple-terraform-ubuntu-install.sh script for Ubuntu)
chmod +x manager.sh # one time
terraform init -upgrade
```

Working with the script:
```
./manager.sh start_cluster
./manager.sh stop_cluster
./manager.sh status_cluster
```

Custom parameters on start:
```
terraform apply -var "webservers_count=3"
terraform apply -var "nginx_docker_tag=latest" -var "js-webserver_docker_tag=latest"
```

Testing:
```
curl localhost:7777
curl localhost:7777/health
curl localhost:8000/health # Where 0 - is X (webserver)
```


Notes:
- [Nginx as round-robin load-balancer](http://nginx.org/en/docs/http/load_balancing.html#:~:text=When%20the%20load%20balancing%20method,balancing%20to%20distribute%20the%20requests.)