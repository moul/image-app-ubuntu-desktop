## -*- docker-image-name: "armbuild/ocs-app-ubuntudesktop:vivid" -*-
FROM armbuild/ocs-distrib-ubuntu:vivid
MAINTAINER Online Labs <opensource@ocs.online.net> (@online_en)


# Prepare rootfs for image-builder
RUN /usr/local/sbin/builder-enter


# Install packages
RUN apt-get -q update &&      \
    apt-get -y -qq upgrade && \
    apt-get install -y -q     \
        gtk2-engines-murrine \
        lxde-core \
        lxterminal \
        pwgen \
        tightvncserver \
        ttf-ubuntu-font-family \
        x11vnc \
        xvfb \
    && apt-get clean


# Patch rootfs
ADD ./patches/etc/ /etc/
ADD ./patches/usr/ /usr/
ADD ./patches/root/ /root/
ADD ./patches/home/ /home/


# Clean rootfs from image-builder
RUN /usr/local/sbin/builder-leave
