FROM centos:latest

RUN dnf -q -y update

RUN dnf -y install langtable glibc-locale-source glibc-langpack-ru glibc-langpack-ru
#use --quiet to supress warnings!
RUN localedef -c --quiet --no-archive -i ru_RU -f UTF-8 ru_RU.UTF-8

ENV LANG ru_RU.UTF-8
ENV LANGUAGE ru_RU:UTF-8
ENV LC_ALL ru_RU.UTF-8

RUN rpm --import http://repo.postgrespro.ru/keys/GPG-KEY-POSTGRESPRO
COPY postgrespro-1c.repo /etc/yum.repos.d
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

# Version env
#ENV PG_MAJOR 11
#ENV PG_MINOR 4.1
#ENV PG_RELEASE $PG_MAJOR.$PG_MINOR
#ENV PG_VERSION $PG_RELEASE-1.stretch.pro


VOLUME /var/lib/pgpro/1c-12/data
VOLUME /var/log/postgresql

COPY docker-entrypoint.sh /
RUN chmod a+x /docker-entrypoint.sh
#COPY container/postgresql.conf $PGDATA
RUN echo 127.0.0.1 srv-pg.solar srv-pg localhost > /etc/hosts

ENTRYPOINT ["/docker-entrypoint.sh"]

EXPOSE 5432
CMD ["postgres"]

# ENTRYPOINT ["/bin/bash"]
