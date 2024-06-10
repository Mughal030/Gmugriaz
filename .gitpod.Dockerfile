FROM gitpod/workspace-full:latest

# Install necessary packages for GUI
RUN sudo apt-get update \
    && sudo apt-get install -y \
        xfce4 \
        xfce4-goodies \
        tightvncserver \
    && sudo apt-get clean \
    && sudo rm -rf /var/lib/apt/lists/*

# Set up VNC password
RUN mkdir ~/.vnc \
    && echo umair@030200 | vncpasswd -f >> ~/.vnc/passwd \
    && chmod 600 ~/.vnc/passwd

# Set up VNC startup script
RUN echo "#!/bin/bash" >> ~/start_vnc.sh \
    && echo "vncserver :1 -localhost no -geometry 1280x800 -depth 24" >> ~/start_vnc.sh \
    && chmod +x ~/start_vnc.sh

# Start VNC server on workspace launch
CMD ["bash", "-c", "~/start_vnc.sh && sleep infinity"]
