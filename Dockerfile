FROM babim/alpinebase

# install
RUN apk add --no-cache bash curl
RUN curl -s https://raw.githubusercontent.com/babim/docker-tag-options/master/z%20Netdata%20install/netdata_install.sh | bash

# environment
WORKDIR /
ENV NETDATA_PORT=19999 SSMTP_TLS=YES SSMTP_SERVER=smtp.gmail.com SSMTP_PORT=587 SSMTP_HOSTNAME=localhost
EXPOSE $NETDATA_PORT
VOLUME /etc/netdata

# entry point
ENTRYPOINT ["/docker-entrypoint.sh"]
