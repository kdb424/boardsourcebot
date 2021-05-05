#!/usr/bin/env bash

docker build -t boardsourcebot .
docker run --rm boardsourcebot
