FROM ruby:3.2

WORKDIR /app
RUN apt-get update && apt-get install -y ca-certificates curl gnupg build-essential libpq-dev postgresql-client

COPY Gemfile Gemfile.lock ./

RUN bundle install

COPY . .

EXPOSE 3000
