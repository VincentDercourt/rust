FROM debian:latest

LABEL maintainer="pixel@rageclic.fr" \
	  version=1.0 \
	  description="Create a server Rust"

RUN apt-get update \
    && dpkg --add-architecture i386 \
    && apt-get update \
    && apt-get install -y mailutils postfix curl wget file bzip2 gzip unzip binutils bsdmainutils python util-linux ca-certificates tmux lib32gcc1 libstdc++6 libstdc++6:i386 expect sudo

COPY ./*.* /

RUN chmod 755 /start.sh \
    && sed -i -e 's/\r$//' /start.sh \
    && useradd -ms /bin/bash rustserver \
    && echo "rustserver:rustserver" | chpasswd && adduser rustserver sudo

VOLUME /home/rustserver

USER rustserver

WORKDIR /home/rustserver

EXPOSE 80 28015 28016 28015/udp 28016/udp

CMD ["/start.sh"]