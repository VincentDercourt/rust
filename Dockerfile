FROM debian:latest

LABEL maintainer="pixel@happyguard.fr" \
	  version=1.0 \
	  description="Create a server Rust"

RUN apt-get update \
    && dpkg --add-architecture i386 \
    && apt-get update \
    && apt-get install -y mailutils postfix curl wget file bzip2 gzip unzip binutils bsdmainutils python util-linux ca-certificates tmux lib32gcc1 libstdc++6 libstdc++6:i386 bc lib32z1 locales expect sudo
    
COPY ./*.* /

RUN chmod 755 /start.sh \
    && sed -i -e 's/\r$//' /start.sh \
    && useradd -ms /bin/bash rustserver \
    && echo "rustserver:rustserver" | chpasswd && adduser rustserver sudo \
    && usermod -G tty rustserver
RUN sed -i -e 's/# fr_FR.UTF-8 UTF-8/fr_FR.UTF-8 UTF-8/' /etc/locale.gen && \
    locale-gen

VOLUME /home/rustserver

USER rustserver

ENV LANG fr_FR.UTF-8  
ENV LANGUAGE fr_FR:fr  
ENV LC_ALL fr_FR.UTF-8

WORKDIR /home/rustserver

EXPOSE 80 28015 28016 28015/udp 28016/udp

CMD ["/start.sh"]