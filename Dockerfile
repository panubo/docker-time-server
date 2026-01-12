# Does not build beyond alpine:3.20, may require upstream fixes for gcc15 and
# legacy C library functions eg fcvt, ecvt, and gcvt
FROM alpine:3.20

ENV XINETD_VERSION=2.3.15.4

RUN set -x \
  && cd /tmp \
  && apk --no-cache add s6 xz build-base \
  && wget "https://github.com/openSUSE/xinetd/releases/download/${XINETD_VERSION}/xinetd-${XINETD_VERSION}.tar.xz" \
  && tar -xf xinetd-${XINETD_VERSION}.tar.xz \
  && cd xinetd-${XINETD_VERSION} \
  && ./configure \
  && make \
  && make install \
  && install -m 0644 -D -t /etc/xinetd.d /tmp/xinetd-${XINETD_VERSION}/contrib/xinetd.d/* \
  && apk --no-cache del xz build-base \
  && cd / \
  && rm -rf /tmp/* \
  ;

COPY s6/ /etc/s6/
COPY xinetd.conf /etc/xinetd.conf

RUN set -x \
  # Enable the services
  && sed -i 's/disable.*/disable\t\t= no/' /etc/xinetd.d/time /etc/xinetd.d/time-udp \
  # Use same underprivileged user as xinetd daemon
  && sed -i 's/user.*/user\t\t= 1000/' /etc/xinetd.d/time /etc/xinetd.d/time-udp \
  # List the UDP service: "2 available services"
  && sed -i 's/\ttype.*/\ttype\t\t= INTERNAL/' /etc/xinetd.d/time /etc/xinetd.d/time-udp \
  ;

EXPOSE 37/tcp
EXPOSE 37/udp

CMD ["s6-svscan","/etc/s6"]
