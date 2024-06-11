FROM kalilinux/kali-rolling

# Set environment variables to avoid interactive prompts
ENV DEBIAN_FRONTEND=noninteractive

# Install necessary packages including debconf-utils for preconfiguration
RUN apt-get update && apt-get install -y \
    debconf-utils \
    kali-linux-default \
    kali-tools-top10 \
    kali-linux-headless \
    tightvncserver \
    novnc \
    websockify \
    && apt-get clean

# Preconfigure the keyboard layout to "English (UK)"
RUN echo "keyboard-configuration keyboard-configuration/layout select English (UK)" | debconf-set-selections
RUN echo "keyboard-configuration keyboard-configuration/variant select English (UK)" | debconf-set-selections

# Set the locale
ENV LANG C.UTF-8

# Expose the VNC port
EXPOSE 5901

# Start the VNC server and noVNC
CMD ["sh", "-c", "vncserver :1 -geometry 1280x800 -depth 24 && websockify -D --web /usr/share/novnc/ --cert /etc/ssl/novnc.pem 5901 localhost:5901"]
