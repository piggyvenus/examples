FROM fabric8/s2i-java:latest
MAINTAINER Shanna Chan “shchan@redhat.com”

EXPOSE 8080
COPY /osdemo-0.0.1-SNAPSHOT.jar /app/app.jar
WORKDIR /app
ENTRYPOINT ["java", "-jar", "app.jar"]
