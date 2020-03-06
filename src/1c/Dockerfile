FROM centos:latest
MAINTAINER alter@centos.solar

###############################################################################
# PREPARE

RUN echo 127.0.0.1 srv-1c.solar srv-1c localhost > /etc/hosts

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

RUN dnf -y install curl libgsf unixODBC fontconfig freetype
# also may require:
# policycoreutils-python  cabextract  xorg-x11-font-utils ImageMagick msttcore-fonts-installer libatk
RUN dnf -y install bzip2 

ADD *.rpm /tmp/

#ENV PLATFORM_VERSION 83
#ENV SERVER_VERSION 8.3.16-1224
#RUN dnf -y localinstall /tmp/1C_Enterprise$PLATFORM_VERSION-common-${SERVER_VERSION}.x86_64.rpm 2> /dev/null
#RUN dnf -y localinstall /tmp/1C_Enterprise$PLATFORM_VERSION-server-${SERVER_VERSION}.x86_64.rpm 2> /dev/null

RUN dnf -y localinstall /tmp/*.x86_64.rpm
RUN rm /tmp/*.rpm

RUN mkdir --parent /var/log/1C /home/usr1cv8/.1cv8/1C/1cv8/conf
RUN chown usr1cv8:grp1cv8 -R /var/log/1C /home/usr1cv8

COPY container/docker-entrypoint.sh /
COPY container/logcfg.xml /home/usr1cv8/.1cv8/1C/1cv8/conf
RUN chmod a+x /docker-entrypoint.sh

VOLUME /home/usr1cv8
VOLUME /var/log/1C

ENTRYPOINT ["/docker-entrypoint.sh"]
EXPOSE 1540-1541 1560-1591
CMD ["ragent"]