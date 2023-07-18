FROM ubuntu:18.04
RUN apt-get update && apt-get install openjdk-11-jre -y
WORKDIR /app
COPY target/my-app-1.0.2.jar .
CMD [ "java","-jar","my-app-1.0.2.jar"]


