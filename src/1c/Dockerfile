FROM centos:latest
MAINTAINER alter@centos.solar

RUN rm -r /var/cache/dnf
ENV LC_ALL=C.UTF-8 LANG=ru_RU.UTF-8 LANGUAGE=ru_RU.UTF-8 TERM=xterm

RUN dnf -y update
RUN dnf -y install epel-release

#RUN dnf -y install curl 
RUN dnf -y install libgsf 
#RUN dnf -y install policycoreutils-python 
RUN dnf -y install unixODBC 
#RUN dnf -y install cabextract 
#RUN dnf -y install xorg-x11-font-utils 
RUN dnf -y install fontconfig 
RUN dnf -y install freetype
#RUN dnf -y install ImageMagick 
#RUN dnf -y install msttcore-fonts-installer 
#RUN dnf -y install libatk
RUN dnf -y install bzip2 

RUN dnf -y install langtable glibc-locale-source glibc-langpack-ru glibc-langpack-ru
#use --quiet to supress warnings!
RUN localedef -c --quiet --no-archive -i ru_RU -f UTF-8 ru_RU.UTF-8

ENV LANG ru_RU.UTF-8
ENV LANGUAGE ru_RU:UTF-8
ENV LC_ALL ru_RU.UTF-8

ADD *.rpm /tmp/

ENV PLATFORM_VERSION 83
ENV SERVER_VERSION 8.3.16-1224

#RUN dnf -y localinstall /tmp/1C_Enterprise$PLATFORM_VERSION-common-${SERVER_VERSION}.x86_64.rpm 2> /dev/null
#RUN dnf -y localinstall /tmp/1C_Enterprise$PLATFORM_VERSION-server-${SERVER_VERSION}.x86_64.rpm 2> /dev/null
RUN dnf -y localinstall /tmp/*.x86_64.rpm
RUN rm /tmp/*.rpm
RUN mkdir --parent /var/log/1C /home/usr1cv8/.1cv8/1C/1cv8/conf
RUN chown --recursive usr1cv8:grp1cv8 /var/log/1C /home/usr1cv8

COPY container/docker-entrypoint.sh /
COPY container/logcfg.xml /home/usr1cv8/.1cv8/1C/1cv8/conf

ENTRYPOINT ["/docker-entrypoint.sh"]

VOLUME /home/usr1cv8
VOLUME /var/log/1C

EXPOSE 1540-1541 1560-1591

CMD ["ragent"]
