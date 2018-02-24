FROM gameservermanagers/linuxgsm-docker:latest

LABEL maintainer="contact@vincentdercourt.fr" \
	  version=1.0 \
	  description="Create a server with gameservermanagers"

USER root

workdir /home/lgsm

ENV serverName=rustserver
ENV steamuser=anonymous
ENV steampass=

RUN mkdir /home/lgsm/lgsm/config-lgsm/rustserver
RUN mkdir /home/lgsm/serverfiles/oxide
RUN mkdir /home/lgsm/serverfiles/server/rustserver

VOLUME /home/lgsm
VOLUME /home/lgsm/lgsm/config-lgsm/rustserver #Contient les fichiers de configuration
VOLUME /home/lgsm/serverfiles/oxide #Contient les fichier d'oxide (Inutile si oxide non installé)
VOLUME /home/lgsm/serverfiles/server/rustserver #Contient les maps et bdds utilisateurs

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