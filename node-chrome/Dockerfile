FROM ubuntu:precise
MAINTAINER Daniel Anggrianto "d.anggrianto@gmail.com"

# INSTALL PACKAGE
RUN apt-get update
RUN apt-get -y upgrade
RUN apt-get install -y  python-software-properties software-properties-common

# Install Java.
RUN \
  echo oracle-java6-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \
  add-apt-repository -y ppa:webupd8team/java && \
  apt-get update && \
  apt-get install -y oracle-java7-installer && \
  rm -rf /var/lib/apt/lists/*

RUN apt-get update
RUN apt-get install -y xvfb wget unzip x11vnc
RUN apt-get install -y -q xfonts-100dpi xfonts-75dpi xfonts-scalable xfonts-cyrillic


# CHROME DRIVER
ADD http://chromedriver.storage.googleapis.com/2.10/chromedriver_linux64.zip /opt/chromedriver_linux64.zip
RUN unzip /opt/chromedriver_linux64.zip -d /usr/bin
RUN chmod 755 /usr/bin/chromedriver

# INSTALL GOOGLE CHROME
RUN wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
RUN dpkg --install google-chrome-stable_current_amd64.deb || apt-get -f install -y
RUN rm -f /opt/google/chrome/chrome-sandbox
RUN wget https://googledrive.com/host/0B5VlNZ_Rvdw6NTJoZDBSVy1ZdkE -O /opt/google/chrome/chrome-sandbox

RUN chown root:root /opt/google/chrome/chrome-sandbox && chmod 4755 /opt/google/chrome/chrome-sandbox && md5sum /opt/google/chrome/chrome-sandbox
RUN useradd chrome -m -s /bin/bash

# SELENIUM
ADD http://selenium-release.storage.googleapis.com/2.43/selenium-server-standalone-2.43.1.jar /home/chrome/selenium-server.jar
RUN chown chrome:chrome /home/chrome/selenium-server.jar
RUN mkdir /.pki && chown chrome:chrome /.pki && mkdir /.local && chown chrome:chrome /.local

#USER chrome
WORKDIR /home/chrome
ADD node.sh /home/chrome/node.sh
RUN chmod 755 /home/chrome/node.sh
CMD ["/bin/bash", "/home/chrome/node.sh"]