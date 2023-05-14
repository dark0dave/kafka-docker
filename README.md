[![Docker Pulls](https://img.shields.io/docker/pulls/dark0dave/kafka.svg)](https://hub.docker.com/r/dark0dave/kafka/)
[![Docker Stars](https://img.shields.io/docker/stars/dark0dave/kafka.svg)](https://hub.docker.com/r/dark0dave/kafka/)
![Build Status](https://github.com/dark0dave/kraft-docker/actions/workflows/main.yaml/badge.svg)


kafka-docker
============

Dockerfile for [Apache Kafka](http://kafka.apache.org/) running kraft. Because I hate zookeeper.

The image is available directly from [Docker Hub](https://hub.docker.com/r/dark0dave/kafka/)

## Usage

- docker build -t kafka .
- docker run -d -p 9092:9092 kafka

This runs kafka without zookeeper in a single instance mode, topics are created automatically there is no need to create them beforehand.
