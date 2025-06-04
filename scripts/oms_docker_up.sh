#!/bin/bash

cd ~/Projects/oms-ms || exit 1
docker compose -f db/scripts/docker-compose.yml up -d
