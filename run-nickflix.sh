#!/bin/bash

set -ex

MEDIASRC="/volume"
MEDIADEST="/config"
PLEXCONFIGSRC="/volume/docker/nickflix/config"
PLEXCONFIGDST="/config"
disableRemoteSecurity="0"
ManualPortMappingMode="1"
AcceptedEULA="1"
PublishServerOnPlexOnlineKey="1"
PLEXPYCONFIGSRC="/volume/docker/nickflix/plexpy"
PLEXPYCONFIGDST="/config"
PLEXPYLOGSRC="$PLEXCONFIGSRC"
PLEXPYLOGDST="/logs:ro"

#/usr/local/bin/docker-compose pull
/usr/local/bin/docker-compose kill
/usr/local/bin/docker-compose rm -f
/usr/local/bin/docker-compose up -d
