# !/usr/bin/bash 

# Check that the parameters are given
if test "$#" -ne 2; then
    echo "Usage: $0 githubuser/reponame dockerhubuser/reponame"
    exit 
fi 

# Clone the git repository 
git clone https://github.com/$1 tmp

# Build docker image 
docker build ./tmp -t container

# Login on Dockerhub 
docker login --username = $DOCKER_USER --password = $DOCKER_PASSWORD
docker tag container $2 

# Push Docker image to Dockerhub 
docker push $2 
rm -rf ./tmp 