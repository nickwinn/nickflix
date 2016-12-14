#!/bin/bash
if [ ! -d "/config/Plex Media Server" ]; then
  mkdir "/config/Plex Media Server" && cp ~/Preferences.xml "/config/Plex Media Server/Preferences.xml"
  exit 0
fi

#rm -f "/config/Plex Media Server/plexmediaserver.pid"
#/etc/init.d/plexmediaserver start
#sleep 5
#tail -f /config/Plex\ Media\ Server/Logs/*.log
