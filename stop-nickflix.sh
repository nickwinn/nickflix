#!/bin/bash

set -ex

/usr/local/bin/docker-compose kill
/usr/local/bin/docker-compose rm -f
