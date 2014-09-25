#!/bin/bash

export DISPLAY=:99
Xvfb :99 -shmem -screen 0 1366x768x16 &

java -Djava.security.egd=file:/dev/random \
-jar /opt/selenium-server.jar \
-role node \
-hubHost ${HUB_PORT_4444_TCP_ADDR} \
-hubPort ${HUB_PORT_4444_TCP_PORT} \
-browser browserName=firefox,maxInstances=1,platform=LINUX
