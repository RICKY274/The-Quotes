
FROM debian:buster-slim

RUN apt-get update
RUN apt-get install -y openjdk-11-jre curl

ADD target/server-1.0-SNAPSHOT-jar-with-dependencies.jar  /srv/server-0.0.0.jar

WORKDIR /srv
EXPOSE 5050
CMD ["java", "-jar", "server-0.0.0.jar"]