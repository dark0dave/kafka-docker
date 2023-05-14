FROM eclipse-temurin:20-jre-jammy

ARG kafka_version=3.4.0
ARG scala_version=2.13
ARG vcs_ref=unspecified
ARG build_date=unspecified

LABEL org.label-schema.name="kafka" \
      org.label-schema.description="Apache Kafka" \
      org.label-schema.build-date="${build_date}" \
      org.label-schema.vcs-url="https://github.com/dark0dave/kafka-docker" \
      org.label-schema.vcs-ref="${vcs_ref}" \
      org.label-schema.version="${scala_version}_${kafka_version}" \
      org.label-schema.schema-version="1.0" \
      maintainer="dark0dave"

ENV KAFKA_VERSION=$kafka_version \
    SCALA_VERSION=$scala_version \
    KAFKA_FILENAME="kafka_${SCALA_VERSION}-${KAFKA_VERSION}.tgz" \
    KAFKA_HOME=/opt/kafka

ENV PATH=${PATH}:${KAFKA_HOME}/bin

COPY download-kafka.sh start-kafka.sh broker-list.sh create-topics.sh versions.sh /usr/bin

WORKDIR /opt

RUN apt-get update && \
    apt-get install -y --no-install-recommends jq net-tools curl wget && \
    wget -q "${KAFKA_FILENAME}"-O - | tar -xz && \
    ln -s /opt/kafka_${SCALA_VERSION}-${KAFKA_VERSION} ${KAFKA_HOME} && \
    rm -rf /var/lib/apt/lists/*

VOLUME ["/kafka"]

# Use "exec" form so that it runs as PID 1 (useful for graceful shutdown)
CMD ["start-kafka.sh"]
