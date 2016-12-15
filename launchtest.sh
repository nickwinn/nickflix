#!/bin/bash

#docker run -it --rm --name testplex -p 32400:32400 -p 32469:32469 -p 8181:8181 -v /volume/docker/testplex/config:/config -v /volume:/volume:ro -v /sys/fs/cgroup:/sys/fs/cgroup:ro --privileged nickflix:base /bin/bash

#docker run -it --rm --name testplex -p 32400:32400 -p 32469:32469 -p 8181:8181 -v /volume/docker/testplex/config:/config -v /volume:/volume:ro -v /sys/fs/cgroup:/sys/fs/cgroup:ro --privileged nickflix:test
docker run -d --name testplex -p 32400:32400 -p 32469:32469 -p 8181:8181 -v /volume/docker/testplex/config:/config -v /volume:/volume:ro -v /sys/fs/cgroup:/sys/fs/cgroup:ro --privileged -e "LC_ALL=en_US.UTF-8" nickflix:test
