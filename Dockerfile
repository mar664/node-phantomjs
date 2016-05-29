FROM selenium/node-base:2.53.0

USER root

#=========
# Phantomjs
#=========
ENV PHANTOMJS 2.1.1-linux-x86_64
RUN apt-get update
RUN apt-get install -y curl bzip2 libfreetype6 libfontconfig

RUN wget https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-$PHANTOMJS.tar.bz2
RUN tar xvjf phantomjs-$PHANTOMJS.tar.bz2
RUN mv phantomjs-$PHANTOMJS /usr/local/share
RUN ln -sf /usr/local/share/phantomjs-$PHANTOMJS/bin/phantomjs /usr/local/bin
RUN chmod -R +x /usr/local/bin
#========================
# Selenium Configuration
#========================
COPY config.json /opt/selenium/config.json

USER root