FROM ubuntu:trusty
MAINTAINER Daniel Anggrianto "d.anggrianto@gmail.com"

# INSTALL PACKAGE
RUN apt-get update
RUN apt-get -y upgrade
RUN apt-get install -y openjdk-7-jre-headless 

# INSTALL SELENIUM SERVER
ADD http://selenium-release.storage.googleapis.com/2.43/selenium-server-standalone-2.43.1.jar /opt/selenium-server.jar

# PORT
EXPOSE 4444

# RUN HUB
CMD ["usr/bin/java", "-jar", "/opt/selenium-server.jar", "-role", "hub", "-port", "4444"]

