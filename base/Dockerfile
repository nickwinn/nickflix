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
RUN yum -y update && \
    yum -y install initscripts libselinux-utils-2.5-6.el7.x86_64 vim wget epel-release less && \
    yum -y install xmlstarlet multitail supervisor && \
    yum clean all
ADD plexmediaserver-1.3.2.3112-1751929.x86_64.rpm /root/
CMD ["/usr/sbin/init"]
