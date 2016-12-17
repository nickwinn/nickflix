#!/bin/bash
docker stop $1 && docker rm $1
rm -rf /volume/docker/testplex/config/*
