# Exercise 2.8

## Docker Compose file

We are reusing the scripts again that was constructed in part 1. In this case the images ``backend.base`` and ``frontend.base``.  

In this case, we will add an additional service in the form of ``nginx`` and added the ``depends_on`` to the ``backend-base`` service. It resulted in the following:

```yml
version: '3.8'

services: 
    backend-base: 
        image: backend
        ports:
            - 8080:8080
        environment:
            REDIS_HOST: redis-base
            POSTGRES_HOST: database
            POSTGRES_USER: postgres
            POSTGRES_PASSWORD: postgres
            POSTGRES_DATABASE: postgres
        depends_on:
            - database
            - redis-base
        container_name: backend

    frontend-base: 
        image: frontend
        ports:
            - 5000:5000
        container_name: frontend

    redis-base:
        image: redis 
        container_name: redis-base 

    database:
        image: postgres:alpine
        restart: unless-stopped 
        environment: 
            POSTGRES_PASSWORD: postgres
        container_name: postgres
    
    proxy: 
        image: nginx:alpine
        restart: unless-stopped
        volumes: 
            - ./nginx.conf:/nginx.conf
        ports: 
            - 80:80
        environment: 
            - NGINX_PORT = 80
```

Then the ``docker compose up`` command was run, which resulted in the following outputs:

![compose-up](image/Exercise_2_7_pt1.png)
![frontend pt1](image/Exercise_2_7_pt2.png)
![compose-down and up](image/Exercise_2_7_pt3.png)
![frontend pt 2](image/Exercise_2_7_pt4.png)