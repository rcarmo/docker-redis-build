FROM alpine:3.5
MAINTAINER rcarmo

RUN apk add --update \
      musl \
      build-base \
      linux-headers \
      bash \
      git \
      tcl \
 && mkdir /src \
 && cd /src \
 && git clone https://github.com/antirez/redis.git

RUN cd /src/redis \
 && make \
 && bash runtest
