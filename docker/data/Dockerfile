FROM centos:7
MAINTAINER Black Box Code <contact@blackboxcode.com>

RUN groupadd -r mysql && \
    useradd -r -g mysql mysql && \
    mkdir -p /var/lib/mysql && \
    chown -R mysql:mysql /var/lib/mysql

VOLUME /var/lib/mysql

USER mysql

CMD ["true"]
