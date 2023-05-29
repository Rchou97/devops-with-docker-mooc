# Exercise 2.8

## Docker Compose file

We are reusing the scripts again that was constructed in part 1 and the exercises within part 2. In this case the images ``backend.base`` and ``frontend.base``.  

In this case, we will add an additional service in the form of ``nginx``. It resulted in the following:

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
            REQUEST_ORIGIN: http://localhost:80
        depends_on:
            - database
            - redis-base
        container_name: backend

    frontend-base: 
        image: frontend
        ports:
            - 5000:5000
        container_name: frontend
        environment:
            REACT_APP_BACKEND_URL: http://localhost:80

    redis-base:
        image: redis 
        container_name: redis-base 

    database:
        image: postgres:alpine
        restart: unless-stopped 
        container_name: postgres
        environment: 
            POSTGRES_PASSWORD: postgres
        volumes:
            - ./database:/postgres/var/lib/postgresql/data
 
    proxy: 
        image: nginx:alpine
        restart: unless-stopped
        ports: 
            - 80:80
        depends_on: 
            - frontend-base
            - backend-base 
        volumes:
            - ./nginx.conf:/part_2/nginx.conf
```

And the ``nginx.conf`` file: 

```conf
events { worker_connections 1024; }

http {
  server {
    listen 80;

    location / {
      proxy_pass http://frontend:5000/;
    }

    # configure here where requests to http://localhost/api/...
    # are forwarded
    location /api/ {
      proxy_set_header Host $host;
      proxy_pass http://backend:8080/;
    }
  }
}
```