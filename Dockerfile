FROM  alpine:3.15
RUN apk add openjdk11
COPY target/my-app-1.0.2.jar /
CMD [ "java","-jar","my-app-1.0.2.jar" ]
