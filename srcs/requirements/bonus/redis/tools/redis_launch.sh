#!/bin/bash

if [ ! -f /etc/redis/redis.conf.bak ]; then

cp /etc/redis/redis.conf /etc/redis/redis.conf.bak

cp ./redis.conf /etc/redis/redis.conf

fi

exec "$@"
