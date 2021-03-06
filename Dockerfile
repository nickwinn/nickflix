FROM       centos:centos7
MAINTAINER Snappy Nachos <technick@gmail.com>

ENV container="docker" \
    TERM="xterm" \
    LANG="en_US.UTF-8"

RUN yum -y update && \
    yum -y install initscripts libselinux-utils-2.5-6.el7.x86_64 vim wget epel-release less git && \
    yum -y install supervisor && \
    yum clean all

RUN rpm -Uvh https://downloads.plex.tv/plex-media-server/1.3.2.3112-1751929/plexmediaserver-1.3.2.3112-1751929.x86_64.rpm

ADD PlexMediaServer /etc/sysconfig/PlexMediaServer
ADD BlankPreferences.xml /tmp/BlankPreferences.xml
ADD supervisord.conf /etc/supervisord.conf
ADD initPlex.sh /usr/local/bin/initPlex.sh

RUN mkdir /config && \
    mkdir /data && \
    chown plex:plex /config && \
    chown plex:plex /data && \
    chown plex:plex /usr/local/bin/initPlex.sh && \
    chmod 755 /usr/local/bin/initPlex.sh
VOLUME /config /data

EXPOSE 32400 32469

RUN localedef -v -c -i en_US -f UTF-8 en_US.UTF-8; exit 0
CMD ["/usr/bin/supervisord"]
