Commands:

To init:
```terraform init -upgrade```

To start:

```terraform apply -var "webservers_count=3"```

To stop:

```terraform destroy```


Notes:
- [Nginx as round-robin load-balancer](http://nginx.org/en/docs/http/load_balancing.html#:~:text=When%20the%20load%20balancing%20method,balancing%20to%20distribute%20the%20requests.)