#!/bin/bash

set -ex

export MEDIASRC="/volume"
export MEDIADST="/media"
export PLEXCONFIGSRC="/volume/docker/nickflix/config"
export PLEXCONFIGDST="/config"
export disableRemoteSecurity="1"
export ManualPortMappingMode="1"
export AcceptedEULA="1"
export PublishServerOnPlexOnlineKey="1"
export PLEXPYCONFIGSRC="/volume/docker/nickflix/plexpy"
export PLEXPYCONFIGDST="/config"
export PLEXPYLOGSRC="$PLEXCONFIGSRC"
export PLEXPYLOGDST="/logs"

#/usr/local/bin/docker-compose pull
/usr/local/bin/docker-compose kill
/usr/local/bin/docker-compose rm -f
/usr/local/bin/docker-compose up -d
