#!/usr/bin/env bash

# Build image and add a descriptive tag
docker build --tag=django-polls .

# List docker images
docker image ls

# Run django app
docker run -p 8000:8000 -e db_endpoint -e pgpass -e sky -e static_bucket_name -e static_access_key -e static_secret_key django-polls
