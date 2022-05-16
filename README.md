Commands:

To init:
```terraform init -upgrade```

To start:

```
terraform apply -var "webservers_count=3"
terraform apply -var "nginx_docker_tag=latest" -var "http-echo_docker_tag=latest"
```

To stop:

```terraform destroy```

Access after start:
```
curl localhost:7777
curl localhost:7777/health
```


Notes:
- [Nginx as round-robin load-balancer](http://nginx.org/en/docs/http/load_balancing.html#:~:text=When%20the%20load%20balancing%20method,balancing%20to%20distribute%20the%20requests.)