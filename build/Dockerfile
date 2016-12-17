FROM       centos:centos7
MAINTAINER Snappy Nachos <technick@gmail.com>

ENV container="docker" \
    TERM="xterm" \
    LANG="en_US.UTF-8"

RUN (cd /lib/systemd/system/sysinit.target.wants/; for i in *; do [ $i == \
systemd-tmpfiles-setup.service ] || rm -f $i; done); \
rm -f /lib/systemd/system/multi-user.target.wants/*;\
rm -f /etc/systemd/system/*.wants/*;\
rm -f /lib/systemd/system/local-fs.target.wants/*; \
rm -f /lib/systemd/system/sockets.target.wants/*udev*; \
rm -f /lib/systemd/system/sockets.target.wants/*initctl*; \
rm -f /lib/systemd/system/basic.target.wants/*;\
rm -f /lib/systemd/system/anaconda.target.wants/*;
VOLUME [ "/sys/fs/cgroup" ]
RUN localedef -v -c -i en_US -f UTF-8 en_US.UTF-8; exit 0
RUN yum -y update && \
    yum -y install initscripts libselinux-utils-2.5-6.el7.x86_64 vim wget epel-release less && \
    yum -y install xmlstarlet multitail supervisor && \
    yum clean all

RUN rpm -Uvh https://downloads.plex.tv/plex-media-server/1.3.2.3112-1751929/plexmediaserver-1.3.2.3112-1751929.x86_64.rpm
ADD plexmediaserver.service /lib/systemd/system/
ADD Preferences.xml /tmp/Preferences.xml
ADD preplex.sh /usr/local/bin/

RUN mkdir /config && \
    mkdir /data && \
    chown plex:plex /config && \
    chown plex:plex /data && \
    chmod 755 /usr/local/bin/preplex.sh && \
    chown plex:plex /tmp/Preferences.xml && \
    chmod 600 /tmp/Preferences.xml
VOLUME /config /data

EXPOSE 32400 32469

#RUN localedef -v -c -i en_US -f UTF-8 en_US.UTF-8; exit 0
RUN systemctl enable plexmediaserver

CMD ["/usr/sbin/init"]
