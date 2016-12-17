PREFERENCES="/config/Plex Media Server/Preferences.xml"

if [ ! -d "/config/Plex Media Server" ]
then
  mkdir "/config/Plex Media Server"
fi

if [[ ! -f "/config/Plex Media Server/Preferences.xml" ]]
then
  cp /tmp/BlankPreferences.xml "/config/Plex Media Server/Preferences.xml"
fi

if ! grep -q 'disableRemoteSecurity' "/config/Plex Media Server/Preferences.xml"
then
  sed -i -e 's/<Preferences /<Preferences disableRemoteSecurity="0" /' "/config/Plex Media Server/Preferences.xml"
fi

if [[ "$disableRemoteSecurity" == 1 ]]
then
  sed -i -e 's/disableRemoteSecurity="0"/disableRemoteSecurity="1"/' "/config/Plex Media Server/Preferences.xml"
else
  sed -i -e 's/disableRemoteSecurity="1"/disableRemoteSecurity="0"/' "/config/Plex Media Server/Preferences.xml"
fi

if ! grep -q 'ManualPortMappingMode' "/config/Plex Media Server/Preferences.xml"
then
  sed -i -e 's/<Preferences /<Preferences ManualPortMappingMode="1" /' "/config/Plex Media Server/Preferences.xml"
fi

if [[ "$ManualPortMappingMode" == 0 ]]
then
  sed -i -e 's/ManualPortMappingMode="1"/ManualPortMappingMode="0"/' "/config/Plex Media Server/Preferences.xml"
else
  sed -i -e 's/ManualPortMappingMode="0"/ManualPortMappingMode="1"/' "/config/Plex Media Server/Preferences.xml"
fi

if ! grep -q 'AcceptedEULA' "/config/Plex Media Server/Preferences.xml"
then
  sed -i -e 's/<Preferences /<Preferences AcceptedEULA="1" /' "/config/Plex Media Server/Preferences.xml"
fi

if [[ "$AcceptedEULA" == 0 ]]
then
  sed -i -e 's/AcceptedEULA="1"/AcceptedEULA="0"/' "/config/Plex Media Server/Preferences.xml"
else
  sed -i -e 's/AcceptedEULA="0"/AcceptedEULA="1"/' "/config/Plex Media Server/Preferences.xml"
fi

if ! grep -q 'PublishServerOnPlexOnlineKey' "/config/Plex Media Server/Preferences.xml"
then
  sed -i -e 's/<Preferences /<Preferences PublishServerOnPlexOnlineKey="1" /' "/config/Plex Media Server/Preferences.xml"
fi

if [[ "$PublishServerOnPlexOnlineKey" == 0 ]]
then
  sed -i -e 's/PublishServerOnPlexOnlineKey="1"/PublishServerOnPlexOnlineKey="0"/' "/config/Plex Media Server/Preferences.xml"
else
  sed -i -e 's/PublishServerOnPlexOnlineKey="0"/PublishServerOnPlexOnlineKey="1"/' "/config/Plex Media Server/Preferences.xml"
fi
