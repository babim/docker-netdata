FROM babim/alpinebase

## Run option
RUN apk add --no-cache wget bash && cd / && wget --no-check-certificate https://raw.githubusercontent.com/babim/docker-tag-options/master/z%20SCRIPT%20AUTO/option.sh && \
    chmod 755 /option.sh
    
# install
RUN wget --no-check-certificate -O - https://raw.githubusercontent.com/babim/docker-tag-options/master/z%20Netdata/netdata_install.sh | bash

# environment
WORKDIR /
ENV NETDATA_PORT=19999 SSMTP_TLS=YES SSMTP_SERVER=smtp.gmail.com SSMTP_PORT=587 SSMTP_HOSTNAME=localhost
EXPOSE $NETDATA_PORT
VOLUME /etc/netdata/override

# entry point
ENTRYPOINT ["//docker-entrypoint.sh"]
