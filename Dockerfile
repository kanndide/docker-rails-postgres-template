FROM ruby:2.6-alpine
RUN apk update && apk add nodejs build-base libxml2-dev libxslt-dev

RUN mkdir /railsapp
WORKDIR /railsapp

ADD Gemfile /railsapp/Gemfile
ADD Gemfile.lock /railsapp/Gemfile.lock

RUN bundle install

ADD . /railsapp