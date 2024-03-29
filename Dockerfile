## -*- docker-image-name: "armbuild/scw-app-ubuntudesktop:vivid" -*-
FROM armbuild/scw-distrib-ubuntu:vivid
MAINTAINER Scaleway <opensource@scaleway.com> (@scaleway)


# Prepare rootfs for image-builder
RUN /usr/local/sbin/builder-enter


# Install packages
RUN apt-get -q update \
 && apt-get -y -qq upgrade \
 && apt-get install -y -q \
        fluxbox \
        gtk2-engines-murrine \
        lxde-core \
        lxterminal \
        pwgen \
        tightvncserver \
        ttf-ubuntu-font-family \
        x11-apps \
        x11vnc \
        xvfb \
 && apt-get clean


# Patch rootfs
ADD ./patches/etc/ /etc/
ADD ./patches/usr/ /usr/
#ADD ./patches/root/ /root/
ADD ./patches/home/ /home/


# Clean rootfs from image-builder
RUN /usr/local/sbin/builder-leave
