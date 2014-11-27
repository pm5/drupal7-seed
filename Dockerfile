FROM pomin5/php5-nginx:latest
MAINTAINER Pomin Wu <pomin5@gmail.com>
ENV DEBIAN_FRONTEND noninteractive
ENV REFRESHED_AT 2014-11-26

CMD ["/run.sh"]
