# This shell script moves a template preferences file into place before Plex starts for the first time.

if [ ! -d /config/Plex\ Media\ Server ]
then
  mkdir /config/Plex\ Media\ Server
  mv /tmp/Preferences.xml /config/Plex\ Media\ Server/
else
  exit 0
fi
