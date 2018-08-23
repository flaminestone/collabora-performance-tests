#!/usr/bin/env bash
docker build -t collabora-performance-tests .
docker run -it --name collabora-performance-tests collabora-performance-tests
docker cp collabora-performance-tests1:/collabora-performance-tests/video/ video
docker stop collabora-performance-tests