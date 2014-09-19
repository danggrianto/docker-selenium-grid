FROM ubuntu:trusty
MAINTAINER Daniel Anggrianto "d.anggrianto@gmail.com"

# INSTALL PACKAGE
RUN apt-get update
RUN apt-get -y upgrade
RUN apt-get install -y openjdk-7-jre-headless x11vnc xvfb firefox
RUN apt-get install -y -q xfonts-100dpi xfonts-75dpi xfonts-scalable xfonts-cyrillic

# INSTALL SELENIUM SERVER
ADD http://selenium-release.storage.googleapis.com/2.43/selenium-server-standalone-2.43.1.jar /opt/selenium-server.jar
ADD node.sh /opt/node.sh

# PORT
EXPOSE 5999

# RUN HUB
CMD ["/bin/bash", "/opt/node.sh"]
