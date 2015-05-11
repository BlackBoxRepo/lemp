FROM centos:7
MAINTAINER Black Box Code <contact@blackboxcode.com>

# Install php
RUN yum -y update && \
    yum -y install epel-release && \
    rpm -Uvh http://rpms.famillecollet.com/enterprise/remi-release-7.rpm && \
    yum --enablerepo=remi,remi-php56 -y install \
        php-fpm \
        php-mbstring \
        php-pdo \
        php-mysql \
        php-gd \
        php-intl \
        php-opcache \
        php-devel && \
    yum clean all

# Configure php
RUN sed -i 's/\;date\.timezone\ \=/date\.timezone\ \=\ America\/Denver/g' /etc/php.ini && \
    sed -i "s/error_reporting = .*$/error_reporting = E_ERROR | E_WARNING | E_PARSE/" /etc/php.ini && \
    sed -i '/^listen = /clisten = 0.0.0.0:9000' /etc/php-fpm.d/www.conf && \
    sed -i '/^listen.allowed_clients/c;listen.allowed_clients =' /etc/php-fpm.d/www.conf && \
    sed -i '/^;catch_workers_output/ccatch_workers_output = yes' /etc/php-fpm.d/www.conf
EXPOSE 9000

CMD ["/usr/sbin/php-fpm", "--nodaemonize"]
