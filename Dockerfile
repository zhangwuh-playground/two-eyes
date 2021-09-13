FROM ruby:2.6.6-alpine3.10
RUN apk add --update alpine-sdk
RUN apk add  sqlite-dev
#RUN gem sources --add https://gems.ruby-china.com/ --remove https://rubygems.org/
RUN gem install bundler:2.2.21