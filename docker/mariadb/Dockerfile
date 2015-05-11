FROM centos:7
MAINTAINER Black Box Code <contact@blackboxcode.com>

ADD mariadb.repo /etc/yum.repos.d/

RUN yum -y update && \
    yum -y install MariaDB-server && \
    yum clean all

ADD my.cnf /etc/

ADD run.sh /opt/
RUN chmod 744 /opt/run.sh

EXPOSE 3306

USER mysql

CMD ["/opt/run.sh"]
