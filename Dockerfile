ARG FLINK_TAG=latest
FROM flink:${FLINK_TAG}
ARG FLINK_TAG
ENV LOGBACK_VERSION=1.1.10
RUN set -ex; \
  export SLF4J_VERSION=$(ls "${FLINK_HOME}"/lib/slf4j-log4j12-*.jar | sed -e 's/^.*slf4j-log4j12-\(.*\)\.jar$/\1/') ; \
  rm -f "${FLINK_HOME}"/lib/log4j-*.jar "${FLINK_HOME}"/lib/slf4j-log4j12-*.jar ; \
  wget -O "${FLINK_HOME}"/lib/logback-classic-${LOGBACK_VERSION}.jar https://repo1.maven.org/maven2/ch/qos/logback/logback-classic/${LOGBACK_VERSION}/logback-classic-${LOGBACK_VERSION}.jar ; \
  wget -O "${FLINK_HOME}"/lib/logback-core-${LOGBACK_VERSION}.jar https://repo1.maven.org/maven2/ch/qos/logback/logback-core/${LOGBACK_VERSION}/logback-core-${LOGBACK_VERSION}.jar ; \
  wget -O "${FLINK_HOME}"/lib/log4j-over-slf4j-$SLF4J_VERSION.jar https://repo1.maven.org/maven2/org/slf4j/log4j-over-slf4j/$SLF4J_VERSION/log4j-over-slf4j-$SLF4J_VERSION.jar ; \
  mkdir -p ${FLINK_HOME}/plugins/s3-fs-presto ; \ 
  cp ${FLINK_HOME}/opt/flink-s3-fs-presto-$FLINK_TAG.jar ${FLINK_HOME}/plugins/s3-fs-presto
COPY logback.xml ${FLINK_HOME}/conf/ 

