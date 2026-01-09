FROM alpine:3.20

ENV \
  JMETER_VER=5.6.3 \
  JMETER_URL=https://archive.apache.org/dist/jmeter/binaries/apache-jmeter-5.6.3.tgz

RUN set -x \
  && apk --no-cache add openjdk8 curl \
  && curl -sSf "${JMETER_URL}" -o /tmp/apache-jmeter-${JMETER_VER}.tgz \
  ;

RUN set -x \
  && tar -C /opt -zxf /tmp/apache-jmeter-${JMETER_VER}.tgz \
  && curl -sSf https://jmeter-plugins.org/files/packages/jpgc-udp-0.4.zip -o /tmp/jpgc-udp-0.4.zip \
  && curl -sSf https://jmeter-plugins.org/files/packages/jpgc-casutg-2.10.zip -o /tmp/jpgc-casutg-2.10.zip \
  && unzip -d /opt/apache-jmeter-${JMETER_VER} /tmp/jpgc-udp-0.4.zip \
  && unzip -d /opt/apache-jmeter-${JMETER_VER} /tmp/jpgc-casutg-2.10.zip \
  ;
