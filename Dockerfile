FROM       nickflix:base
MAINTAINER Snappy Nachos <technick@gmail.com>

RUN rpm -iUvh /root/plexmediaserver-1.3.2.3112-1751929.x86_64.rpm
#RUN rpm -Uvh https://downloads.plex.tv/plex-media-server/1.3.2.3112-1751929/plexmediaserver-1.3.2.3112-1751929.x86_64.rpm
ADD plexmediaserver.service /lib/systemd/system/
ADD Preferences.xml /root/Preferences.xml

RUN mkdir /config && \
    mkdir /data && \
    chown plex:plex /config && \
    chown plex:plex /data 
VOLUME /config /data

EXPOSE 32400 32469

RUN localedef -v -c -i en_US -f UTF-8 en_US.UTF-8; exit 0
RUN systemctl enable plexmediaserver

CMD ["/usr/sbin/init"]
