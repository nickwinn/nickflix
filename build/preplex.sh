# This shell script moves a template preferences file into place before Plex starts for the first time.
# After the first run, the script will remove the 'disableRemoteSecurity=1'

if [ ! -d /config/Plex\ Media\ Server ]
then
  mkdir /config/Plex\ Media\ Server
  cp /tmp/Preferences.xml /config/Plex\ Media\ Server/
else
  if grep -q 'disableRemoteSecurity="1"' /config/Plex\ Media\ Server/Preferences.xml
  then
    sed -i -e 's/ disableRemoteSecurity="1" / /' /config/Plex\ Media\ Server/Preferences.xml
  fi
fi
