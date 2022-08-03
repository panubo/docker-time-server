FROM alpine:3.16

ENV \
  JMETER_URL=https://dlcdn.apache.org//jmeter/binaries/apache-jmeter-5.5.tgz

RUN set -x \
  && apk --no-cache add openjdk8 curl \
  && curl -sSf "${JMETER_URL}" -o /tmp/apache-jmeter-5.5.tgz \
  ;

RUN set -x \
  && tar -C /opt -zxf /tmp/apache-jmeter-5.5.tgz \
  && curl -sSf https://jmeter-plugins.org/files/packages/jpgc-udp-0.4.zip -o /tmp/jpgc-udp-0.4.zip \
  && curl -sSf https://jmeter-plugins.org/files/packages/jpgc-casutg-2.10.zip -o /tmp/jpgc-casutg-2.10.zip \
  && unzip -d /opt/apache-jmeter-5.5 /tmp/jpgc-udp-0.4.zip \
  && unzip -d /opt/apache-jmeter-5.5 /tmp/jpgc-casutg-2.10.zip \
  ;
