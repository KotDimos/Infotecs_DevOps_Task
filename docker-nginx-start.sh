#!/usr/bin/env bash


docker build -t my_nginx:scratch -f Dockerfile.nginx .
docker run -d -p 127.0.0.1:80:80 my_nginx:scratch
