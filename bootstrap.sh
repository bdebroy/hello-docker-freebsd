#!/bin/sh
#portsnap auto && \
echo "vfs.zfs.prefetch_disable=0" >> /boot/loader.conf && \
pkg install -y ca_root_nss portdowngrade && \
cd /usr/ports/ && portdowngrade lang/go r441745  && \
rm -r /usr/ports/lang/go/ && \
mv /usr/ports/go /usr/ports/lang/go && \
cd /usr/ports/lang/go && make install clean BATCH=yes && \
pkg lock -y go
pkg install -y bash gettext-runtime && \
    cd /usr/ports/sysutils/docker-freebsd/ && make install clean BATCH=yes && \
    dd if=/dev/zero of=/usr/local/dockerfs bs=1024K count=4000 && \
    zpool create -f zroot /usr/local/dockerfs && \
    zfs create -o mountpoint=/usr/docker zroot/docker && \
    sysrc -f /etc/rc.conf docker_enable="YES" && \
    pw groupadd docker && \
    pw groupmod docker -M $USER && \
    pw groupmod operator -m $USER && \
    service docker start
