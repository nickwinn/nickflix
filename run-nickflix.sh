#!/bin/bash

set -ex

#/usr/local/bin/docker-compose pull
/usr/local/bin/docker-compose kill
/usr/local/bin/docker-compose rm
/usr/local/bin/docker-compose up -d
