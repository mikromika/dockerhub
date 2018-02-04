FROM ruby:2.3.1-alpine 
MAINTAINER Mikromike <dev.mikromika@gmail.com>

ADD Gemfile /app/  
ADD Gemfile.lock /app/  
RUN apk --update add --virtual build-dependencies ruby-dev build-base bash && \  
    gem install bundler --no-ri --no-rdoc && \
    cd /app ; bundle install --without development test && \
    apk del build-dependencies
ADD . /app  
RUN chown -R nobody:nogroup /app  
USER nobody  
ENV RACK_ENV production  
EXPOSE 9000
WORKDIR /app  






















