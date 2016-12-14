FROM       centos:centos7
MAINTAINER Snappy Nachos <technick@gmail.com>

RUN yum -y install initscripts libselinux-utils-2.5-6.el7.x86_64 vim wget epel-release less
RUN yum -y install xmlstarlet multitail supervisor
ADD plexmediaserver-1.3.2.3112-1751929.x86_64.rpm /root/
RUN rpm -iUvh /root/plexmediaserver-1.3.2.3112-1751929.x86_64.rpm
#RUN rpm -Uvh https://downloads.plex.tv/plex-media-server/1.3.2.3112-1751929/plexmediaserver-1.3.2.3112-1751929.x86_64.rpm

ADD PlexMediaServer /etc/sysconfig/PlexMediaServer
ADD Preferences.xml /root/Preferences.xml
ADD supervisord.conf /etc/supervisord.conf
ADD start.sh /start.sh

RUN mkdir /config && \
    mkdir /data && \
    chmod 755 /start.sh && \
    chown plex:plex /config && \
    chown plex:plex /data 
VOLUME /config /data

EXPOSE 32400 32469

#CMD ["/bin/bash", "/start.sh"]
#CMD ["/start.sh"]
#CMD ["/usr/bin/supervisord"]
#ENTRYPOINT ["/bin/bash"]
#CMD ["/start.sh"]
