FROM centos:latest
MAINTAINER alter@centos.solar

###############################################################################
# PREPARE

RUN echo 127.0.0.1 srv-pg.solar srv-pg localhost > /etc/hosts

RUN dnf -q -y update
ENV LC_ALL=C.UTF-8 LANG=ru_RU.UTF-8 LANGUAGE=ru_RU.UTF-8 TERM=xterm

RUN dnf -y update
RUN dnf -y install epel-release

RUN dnf -y install langtable glibc-locale-source glibc-langpack-ru glibc-langpack-ru
#use --quiet to supress warnings!
RUN localedef -c --quiet --no-archive -i ru_RU -f UTF-8 ru_RU.UTF-8

ENV LANG=ru_RU.UTF-8 LANGUAGE=ru_RU:UTF-8 LC_ALL=ru_RU.UTF-8

###############################################################################
# BASE

RUN rpm --import http://repo.postgrespro.ru/keys/GPG-KEY-POSTGRESPRO
COPY ./container/postgrespro-1c.repo /etc/yum.repos.d
RUN dnf makecache
RUN dnf -y install postgrespro-1c-12-server postgrespro-1c-12-contrib

# explicitly set user/group IDs
#RUN groupadd -r postgres --gid=999 && useradd -r -g postgres --uid=999 postgres
ENV PATH /opt/pgpro/1c-12/bin:$PATH
ENV PGDATA /var/lib/pgpro/1c-12/data
ENV PGLOG /var/log/postgresql

RUN /opt/pgpro/1c-12/bin/pg-setup initdb --encoding=UTF8 --locale=ru_RU.UTF-8 --data-checksums
#RUN /opt/pgpro/1c-12/bin/pg-setup initdb

#RUN /opt/pgpro/1c-12/bin/pg-setup service enable
#RUN service postgrespro-1c-12 start

RUN su postgres -m -c "/opt/pgpro/1c-12/bin/pg_ctl -D /var/lib/pgpro/1c-12/data -w start \
	&& /opt/pgpro/1c-12/bin/psql --command \"CREATE USER mrp WITH SUPERUSER PASSWORD 'mrp';\" \
	&& /opt/pgpro/1c-12/bin/createdb -O mrp mrp \
	&& /opt/pgpro/1c-12/bin/pg_ctl -D /var/lib/pgpro/1c-12/data -w stop"

RUN mkdir /docker-entrypoint-initdb.d
RUN mkdir /docker-entrypoint-init.d

VOLUME /var/lib/pgpro/1c-12/data
#VOLUME /var/log/postgresql

COPY ./container/docker-entrypoint.sh /
RUN chmod a+x /docker-entrypoint.sh
#COPY container/postgresql.conf $PGDATA

ENTRYPOINT ["/docker-entrypoint.sh"]
EXPOSE 5432
CMD ["postgres"]

# ENTRYPOINT ["/bin/bash"]
