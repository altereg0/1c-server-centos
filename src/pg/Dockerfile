# vim:set ft=dockerfile:
FROM centos:latest

RUN dnf -y update
#RUN rpm -ivh http://1c.postgrespro.ru/keys/postgrespro-1c-centos96.noarch.rpm
#RUN dnf -y install postgresql-pro-1c-9.4

RUN rpm --import http://repo.postgrespro.ru/keys/GPG-KEY-POSTGRESPRO
RUN echo [postgrespro-1c] > /etc/yum.repos.d/postgrespro-1c.repo
RUN echo name=Postgres Pro 1C repo >> /etc/yum.repos.d/postgrespro-1c.repo
RUN echo baseurl=http://repo.postgrespro.ru//pg1c-archive/pg1c-12.1/centos/8/os/x86_64/rpms/ >> /etc/yum.repos.d/postgrespro-1c.repo
RUN echo gpgcheck=1 >> /etc/yum.repos.d/postgrespro-1c.repo
RUN echo enabled=1 >> /etc/yum.repos.d/postgrespro-1c.repo
RUN dnf makecache
RUN dnf -y install postgrespro-1c-12-server-12.1-1.el8.x86_64 postgrespro-1c-12-contrib-12.1-1.el8.x86_64
RUN /opt/pgpro/1c-12/bin/pg-setup initdb
RUN /opt/pgpro/1c-12/bin/pg-setup service enable


# Env section
#ENV GOSU_VERSION 1.11
#ENV LANGUAGE en_US.UTF-8
#ENV LC_ALL en_US.UTF-8
#ENV LANG en_US.UTF-8

# explicitly set user/group IDs
#RUN groupadd -r postgres --gid=999 && useradd -r -g postgres --uid=999 postgres

#RUN mkdir /docker-entrypoint-initdb.d

#RUN mkdir /docker-entrypoint-init.d

# Version env
#ENV PG_MAJOR 11
#ENV PG_MINOR 4.1
#ENV PG_RELEASE $PG_MAJOR.$PG_MINOR
#ENV PG_VERSION $PG_RELEASE-1.stretch.pro

#ENV PATH /usr/lib/postgresql/$PG_MAJOR/bin:$PATH
#ENV PGDATA /var/lib/postgresql/data
#ENV PGLOG /var/log/postgresql
VOLUME /var/lib/postgresql/data

COPY docker-entrypoint.sh /

ENTRYPOINT ["/docker-entrypoint.sh"]

EXPOSE 5432
CMD ["postgres"]
