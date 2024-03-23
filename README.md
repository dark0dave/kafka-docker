[![Docker Pulls](https://img.shields.io/docker/pulls/dark0dave/kafka.svg)](https://hub.docker.com/r/dark0dave/kafka/)
[![Docker Stars](https://img.shields.io/docker/stars/dark0dave/kafka.svg)](https://hub.docker.com/r/dark0dave/kafka/)
![Build Status](https://github.com/dark0dave/kraft-docker/actions/workflows/main.yaml/badge.svg)


kafka-docker
============

Dockerfile for [Apache Kafka](http://kafka.apache.org/) running kraft. Because I hate zookeeper.

The image is available directly from [Docker Hub](https://hub.docker.com/r/dark0dave/kafka/)

## Usage

```sh
docker build -t kafka .
docker run -it -p 9092:9092 kafka
```

This runs kafka without zookeeper in a single instance mode, topics are created automatically there is no need to create them beforehand.

### Auto create topics

Can create topics at start time with the following:

```sh
docker run -it -e KAFKA_CREATE_TOPICS=topic1:1:1,topic2:1:1 -p 9092:9092 kafka
```

### Logging

Logging can be controlled with, the runtime environment varriable LOG4J_LOGGER_KAFKA.

Log levels available:

Level|Description
----|----
OFF|Turns off logging.
FATAL|Severe errors that cause premature termination.
ERROR|Other runtime errors or unexpected conditions.
WARN|Runtime situations that are undesirable or unexpected, but not necessarily wrong.
INFO|Runtime events of interest at startup and shutdown.
DEBUG|Detailed diagnostic information about events.
TRACE|Detailed diagnostic information about everything.


Example below:

```sh
docker run -it --rm -e LOG4J_LOGGER_KAFKA=DEBUG -p 9092:9092 kafka
```
