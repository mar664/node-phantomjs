FROM selenium/node-base:2.53.0

USER root

#=========
# Phantomjs
#=========
ENV PHANTOM_JS_VERSION phantomjs-2.1.1-linux-x86_64

RUN apt-get update
RUN apt-get install -y curl bzip2 libfreetype6 libfontconfig

RUN curl -sSL https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-$PHANTOM_JS_VERSION.tar.bz2 | tar xjC /
RUN ln -s phantomjs-$PHANTOM_JS_VERSION /phantomjs

ENTRYPOINT ["/phantomjs/bin/phantomjs"]

#========================
# Selenium Configuration
#========================
COPY config.json /opt/selenium/config.json

USER seluser