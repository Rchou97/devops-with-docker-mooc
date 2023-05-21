# Exercise 1.11: Spring

## spring.base file

First I needed to copy the repository with: ``git clone https://github.com/docker-hy/material-applications.git`` before continue with the ``spring.base`` script. After that, the ``spring.base`` file is put in the path: ``part_1\material-applications\simple-web-service``. The ``spring.base`` dockerfile consists of the following commands:

``# We need Java 8`` <br/>
``FROM openjdk:8`` <br/>
``EXPOSE 8080`` <br/>
``WORKDIR /usr/src/app`` <br/>
``COPY . .`` <br/>
``# Could not find mvnw package, so needed to apply the code below to run it`` <br/>
``RUN apt-get update && apt-get install -y dos2unix && find . -type f -print0 | xargs -0 dos2unix`` <br/>
``RUN ./mvnw package`` <br/>
``CMD ["java", "-jar", "./target/docker-example-1.1.3.jar"]``

Then the ``spring.base`` script was run with the command: ``docker build . -f spring.base -t spring``:

![Output Exercise 1.11 pt 1](image/Exercise_1_11_Spring_pt1.png)

After the ``spring.base`` file was ran, then it was followed up with the command ``docker run -p 8080:8080 spring``:

![Output Exercise 1.11 pt 2](image/Exercise_1_11_Spring_pt2.png)

When going to ``localhost:8080/press`` and press the "Press here" button, it gave the message "Success":

![Success](image/Exercise_1_11_Spring_pt3.png)