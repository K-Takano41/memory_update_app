FROM ruby:3.2.1
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs postgresql-client redis-server
RUN mkdir /rails
WORKDIR /rails
COPY Gemfile /rails/Gemfile
COPY Gemfile.lock /rails/Gemfile.lock
RUN gem install bundler
RUN bundle install
COPY . /rails
ENTRYPOINT ["/rails/bin/docker-entrypoint"]

EXPOSE 3000
CMD [ "rails", "s", "-b", "-p", "3000" ]
