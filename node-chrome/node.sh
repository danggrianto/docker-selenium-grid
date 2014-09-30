#!/bin/bash
set -e
su chrome <<'EOF'
export DISPLAY=:99
Xvfb :99 -shmem -screen 0 1366x768x16 &
java -jar /home/chrome/selenium-server.jar -role node -hubHost ${HUB_PORT_4444_TCP_ADDR} -hubPort ${HUB_PORT_4444_TCP_PORT}  -browser browserName=chrome,maxInstances=1,platform=LINUX
EOF