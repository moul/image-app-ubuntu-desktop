## -*- docker-image-name: "armbuild/ocs-app-ubuntudesktop:vivid" -*-
FROM armbuild/ocs-distrib-ubuntu:vivid
MAINTAINER Online Labs <opensource@ocs.online.net> (@online_en)


# Prepare rootfs for image-builder
RUN /usr/local/sbin/builder-enter


# Install packages
RUN apt-get -q update &&      \
    apt-get -y -qq upgrade && \
    apt-get install -y -q     \
        lxde-core \
        lxterminal \
        pwgen \
        tightvncserver \
        x11vnc \
        xvfb \
    && apt-get clean


# Patch rootfs
ADD ./patches/etc/ /etc/
ADD ./patches/usr/ /usr/


# Clean rootfs from image-builder
RUN /usr/local/sbin/builder-leave
