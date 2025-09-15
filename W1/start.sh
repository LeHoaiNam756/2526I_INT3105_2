#!/bin/bash

service ssh start

chown -R hoainam:hoainam /home/hoainam/.vnc

su - hoainam -c "vncserver -geometry 1280x800 -depth 24 :1 -localhost no"

echo "Services started successfully:"
echo "- SSH server running on port 22"
echo "- VNC server running on port 5901"

tail -f /dev/null
