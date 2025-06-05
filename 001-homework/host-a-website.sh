#!/bin/zsh

docker run \
--name fhw-nginx \
--rm \
-v ./data:/www/data \
-v ./conf.d:/etc/nginx/conf.d \
-v ./nginx.conf:/etc/nginx/nginx.conf \
-p 8080:80 \
nginx:latest
