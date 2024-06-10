FROM kalilinux/kali-rolling

# Install necessary packages
RUN apt-get update && apt-get install -y \
    kali-linux-default \
    kali-tools-top10 \
    kali-linux-headless \
    tightvncserver \
    novnc \
    websockify \
    && apt-get clean

# Set the locale
ENV LANG C.UTF-8

# Expose the VNC port
EXPOSE 5901

# Start the VNC server and noVNC
CMD ["sh", "-c", "vncserver :1 -geometry 1280x800 -depth 24 && websockify -D --web /usr/share/novnc/ --cert /etc/ssl/novnc.pem 5901 localhost:5901"]
