#!/bin/sh
portsnap auto && \
pkg install -y ca_root_nss bash gettext-runtime sqlite3 && \
    cd /usr/ports/sysutils/docker-freebsd/ && make install clean BATCH=yes && \
    dd if=/dev/zero of=/usr/local/dockerfs bs=1024K count=4000 && \
    zpool create -f zroot /usr/local/dockerfs && \
    zfs create -o mountpoint=/usr/docker zroot/docker && \
    sysrc -f /etc/rc.conf docker_enable="YES" && \
    pw groupadd docker && \
    pw groupmod docker -M $USER && \
    service docker start
