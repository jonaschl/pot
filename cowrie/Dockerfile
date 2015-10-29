# crowie
FROM jonatanschlag/debian-jessie-armv7:latest
MAINTAINER jonatanschlag

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -y supervisor python git python-twisted python-pycryptopp python-mysqldb
#create folders  
RUN mkdir -p /opt/crowie /opt/cowrie/logs /opt/cowrie/downloads /opt/cowrie/misc /opt/cowrie/keys /var/run/kippo /opt/cowrie/base /opt/cowrie/data

# create user and group pot  
RUN addgroup --gid 2000 pot && adduser --system --no-create-home --shell /bin/bash --uid 2000 --disabled-password --disabled-login --gid 2000 pot

# clone cowrie
git clone https://github.com/micheloosterhof/cowrie.git /opt/crowie/base
# set permissions
RUN chown pot:pot -R /opt/crowie && chown pot:pot /var/run/kippo && chmod 760 -R /opt

# add supervisord and cowrie conf 
ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf
ADD cowrie.cfg /opt/cowrie/base

#clean up
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# start supervisord
# CMD ["/usr/bin/supervisord"]
