# Exercise 2.3

## Docker Compose file

We are reusing the scripts again that was constructed in part 1. In this case the images ``backend.base`` and ``frontend.base``.  

In this case, we will add the ports where the files were running on. It resulted in the following:

```yml
version: '3.8'

services: 
    backend-base: 
        image: backend
        ports:
            - 8080:8080
        environment:
            REDIS_HOST: redis-base
        container_name: backend

    frontend-base: 
        image: frontend
        ports:
            - 5000:5000
        container_name: frontend

    redis-base:
        image: redis 
        container_name: redis-base 
```

Then the ``docker compose up`` command was run, which resulted in the following outputs:

![compose-up](image/Exercise_2_4_pt1.png)
![frontend](image/Exercise_2_4_pt2.png)