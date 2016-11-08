FROM node:6

MAINTAINER phueper@hueper.net

COPY publish-functions.sh /

WORKDIR /opt/js-joda

RUN git clone https://github.com/js-joda/js-joda.git .
RUN ls -la
