FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    tigervnc-standalone-server \
    tigervnc-common \
    xterm \
    openssh-server \
    sudo \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN useradd -m -s /bin/bash hoainam && echo "hoainam:123456" | chpasswd && usermod -aG sudo hoainam

RUN mkdir /var/run/sshd

RUN mkdir -p /home/hoainam/.ssh && chmod 700 /home/hoainam/.ssh
COPY id_rsa.pub /home/hoainam/.ssh/authorized_keys
RUN chown -R hoainam:hoainam /home/hoainam/.ssh && chmod 600 /home/hoainam/.ssh/authorized_keys

EXPOSE 22 5901

RUN mkdir -p /home/hoainam/.vnc && \
    echo "123456" | vncpasswd -f > /home/hoainam/.vnc/passwd && \
    chown -R hoainam:hoainam /home/hoainam/.vnc && \
    chmod 600 /home/hoainam/.vnc/passwd

COPY start.sh /start.sh
RUN chmod +x /start.sh

CMD ["/start.sh"]
