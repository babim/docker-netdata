FROM babim/alpinebase

RUN apk add --no-cache alpine-sdk bash curl zlib-dev util-linux-dev libmnl-dev gcc make git autoconf automake pkgconfig python logrotate && \
    apk add --no-cache nodejs && \
    git clone https://github.com/firehol/netdata.git --depth=1 && \
    cd netdata && \
    ./netdata-installer.sh

WORKDIR /

ENV NETDATA_PORT 19999
EXPOSE $NETDATA_PORT

CMD /usr/sbin/netdata -D -s /host -p ${NETDATA_PORT}
