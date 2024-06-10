# .gitpod.Dockerfile
FROM gitpod/workspace-full:latest

# Install necessary packages for GUI
USER root
RUN apt-get update \
    && apt-get install -y \
        xfce4 \
        xfce4-goodies \
        tightvncserver \
        novnc \
        websockify \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Set up VNC password
USER gitpod
RUN mkdir ~/.vnc \
    && echo umair@030200 | vncpasswd -f > ~/.vnc/passwd \
    && chmod 600 ~/.vnc/passwd

# Set up VNC startup script
RUN echo "#!/bin/bash" > ~/start_vnc.sh \
    && echo "vncserver :1 -localhost no -geometry 1280x800 -depth 24" >> ~/start_vnc.sh \
    && chmod +x ~/start_vnc.sh

# Ensure the start_vnc.sh script is run on container start
CMD ["bash", "-c", "~/start_vnc.sh && sleep infinity"]
