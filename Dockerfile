FROM ruby:2.3 
EXPOSE 3000
RUN apt-get update -y && apt-get install -y nodejs 
RUN gem install bundler
WORKDIR /app
COPY Gemfile .
COPY Gemfile.lock .
RUN bundle install
COPY . .
CMD ["rails", "server"] 
