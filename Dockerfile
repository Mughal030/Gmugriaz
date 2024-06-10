FROM kalilinux/kali-rolling

# Install necessary packages
RUN apt-get update && apt-get install -y \
    kali-linux-default \
    kali-tools-top10 \
    kali-linux-headless \
    && apt-get clean

# Set the locale
ENV LANG C.UTF-8

# Expose the port you want to use for VNC
EXPOSE 5901

# Start a default command
CMD [ "bash" ]
