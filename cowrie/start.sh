#!/bin/bash
docker run cowrie:latest -p 22:2222 -v /data/cowrie /data/cowrie -d
