FROM ruby:2.7.0
  
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
  
WORKDIR /Billinho
COPY Gemfile /Billinho/Gemfile
COPY Gemfile.lock /Billinho/Gemfile.lock
RUN bundle install
RUN bundle update --bundler
CMD 'rails server -b 0.0.0.0'