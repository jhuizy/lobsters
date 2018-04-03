FROM ruby:2.3 
RUN apt-get update -y && apt-get install -y nodejs 
RUN gem install bundler
WORKDIR /app
COPY Gemfile .
COPY Gemfile.lock .
RUN bundle install
COPY . .
 
