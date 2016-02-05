# Open Monitoring Distribution
#
# Forked from https://github.com/jwarlander/docker-omd
#
## Version: 0.1
# FROM debian:jessie
FROM ubuntu:14.04
MAINTAINER einfachnuralex@gmx.net

RUN apt-get update && \
    apt-get install -y --no-install-recommends ssmtp lsb-release wget nagios-plugins-basic && \
    wget --no-check-certificate https://mathias-kettner.de/support/1.2.6p16/check-mk-raw-1.2.6p16_0.trusty_amd64.deb && \
    (dpkg -i check-mk-raw-1.2.6p16_0.trusty_amd64.deb || true) && \
    apt-get install -y -f --no-install-recommends  && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
    rm -rf check-mk-raw-1.2.6p16_0.trusty_amd64.deb

RUN omd create monitoring
RUN omd config monitoring set TMPFS off
RUN omd config monitoring set APACHE_TCP_ADDR 0.0.0.0

RUN omd create testing
RUN omd config testing set TMPFS off
RUN omd config testing set APACHE_TCP_ADDR 0.0.0.0

# # Add watchdog script
ADD entrypoint.sh /entrypoint.sh

# # Set up runtime options
EXPOSE 80 5000 5001
ENTRYPOINT ["/entrypoint.sh"]

