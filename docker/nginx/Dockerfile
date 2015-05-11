FROM centos:7
MAINTAINER Black Box Code <contact@blackboxcode.com>

RUN rpm -Uvh http://nginx.org/packages/centos/7/noarch/RPMS/nginx-release-centos-7-0.el7.ngx.noarch.rpm && \
    yum -y update && \
    yum -y install nginx && \
    yum clean all

ADD default.conf /etc/nginx/conf.d/
RUN echo "daemon off;" >> /etc/nginx/nginx.conf

RUN mkdir -p /var/www
VOLUME ["/var/www"]

EXPOSE 80

CMD ["/usr/sbin/nginx"]
