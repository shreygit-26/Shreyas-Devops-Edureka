FROM docker.io/library/ubuntu:22.04

RUN apt-get -y update && apt-get -y upgrade

RUN apt install -y openjdk-11-jdk wget

RUN mkdir /usr/local/tomcat

RUN wget https://downloads.apache.org/tomcat/tomcat-9/v9.0.81/bin/apache-tomcat-9.0.81.tar.gz -O /tmp/apache-tomcat-9.0.81.tar.gz

RUN tar xvfz /tmp/apache-tomcat-9.0.81.tar.gz -C /usr/local/tomcat

COPY **/*.war /usr/local/tomcat/apache-tomcat-9.0.81/webapps/

EXPOSE 9090

CMD ["/usr/local/tomcat/apache-tomcat-9.0.81/bin/catalina.sh", "run"]
