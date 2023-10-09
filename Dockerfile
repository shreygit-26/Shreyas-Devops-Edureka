FROM docker.io/library/ubuntu:22.04

RUN apt update && apt upgrade

RUN apt install -y openjdk-11-jdk wget

RUN mkdir /usr/local/tomcat

RUN wget https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.68/bin/apache-tomcat-9.0.68.tar.gz -O /tmp/apache-tomcat-9.0.68.tar.gz

RUN tar xvfz /tmp/apache-tomcat-9.0.68.tar.gz -C /usr/local/tomcat

ENV WAR_PATH=/home/jenkin/build/workspace/code-package/target
ENV TOMCAT_PATH=/usr/local/tomcat/webapps

COPY $WAR_PATH/*.war $TOMCAT_PATH

EXPOSE 8080

CMD ["/usr/local/tomcat/bin/catalina.sh", "run"]



