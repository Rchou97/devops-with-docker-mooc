FROM docker

RUN apk update && apk add git bash 

WORKDIR /scripts

COPY . .

ENTRYPOINT ["/bin/bash", "/script/builder.sh"]