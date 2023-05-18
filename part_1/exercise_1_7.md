# Exercise 1.7: Image for Script

## curler.base file

``FROM ubuntu:20.04`` <br/>
``RUN apt-get update; apt-get install -y curl;`` <br/>
``CMD echo 'Input website:'; read website; echo 'Searching..'; sleep 1; curl http://$website;``

## curler output
![Output Exercise 1.7](image/Exercise_1_7_Image_for_script.png)
