#!/bin/bash

set -ex

#env=${1}
#source ${env}.config

#set | grep REMOTE
#/usr/local/bin/docker-compose pull
/usr/local/bin/docker-compose kill
/usr/local/bin/docker-compose rm
/usr/local/bin/docker-compose up -d
