FROM gameservermanagers/linuxgsm-docker:latest

LABEL maintainer="contact@vincentdercourt.fr" \
	  version=1.0 \
	  description="Create a server with gameservermanagers"

USER root

workdir /home/lgsm

ENV serverName=rustserver
ENV steamuser=anonymous
ENV steampass=

RUN mkdir -p /home/lgsm/lgsm/config-lgsm/rustserver
RUN mkdir -p /home/lgsm/serverfiles/oxide
RUN mkdir -p /home/lgsm/serverfiles/server/rustserver

VOLUME /home/lgsm
VOLUME /home/lgsm/lgsm/config-lgsm/rustserver
VOLUME /home/lgsm/serverfiles/oxide
VOLUME /home/lgsm/serverfiles/server/rustserver

RUN apt-get update \
    && apt-get install -y lib32z1 expect telnet sudo

COPY ./*.* /

RUN chmod 755 /start.sh \
    && sed -i -e 's/\r$//' /start.sh

RUN echo 'lgsm  ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers \
    && usermod -G tty lgsm

USER lgsm    
    
EXPOSE 8080 28015 28016 28015/udp 28016/udp

CMD ["/start.sh"]
