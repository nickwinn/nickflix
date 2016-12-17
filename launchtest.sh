docker run -d --name testplex \
-p 32400:32400 \
-p 32469:32469 \
-v /volume/docker/testplex/config:/config \
-v /volume:/volume:ro \
-e "disableRemoteSecurity=0" \
-e "ManualPortMappingMode=1" \
-e "AcceptedEULA=1" \
-e "PublishServerOnPlexOnlineKey=1" \
--privileged nickflix:test
docker exec -it testplex /bin/bash
docker stop testplex && docker rm testplex
