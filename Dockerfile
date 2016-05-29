FROM selenium/node-base:2.53.0

USER root

#=========
# Phantomjs
#=========

RUN apt-get update
RUN apt-get install -y curl bzip2 libfreetype6 libfontconfig

RUN wget http://bitbucket.org/ariya/phantomjs/downloads/phantomjs-2.1.1-linux-x86_64.tar.bz2
RUN tar xvjf phantomjs-2.1.1-linux-x86_64.tar.bz2
RUN ln -s phantomjs-2.1.1-linux-x86_64 /phantomjs

#========================
# Selenium Configuration
#========================
COPY config.json /opt/selenium/config.json

USER seluser