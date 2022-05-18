FROM ruby:2.7

ENV RAILS_LOG_TO_STDOUT=true
ENV PIDFILE=/dev/null

WORKDIR /opt/app

COPY Gemfile* ./
RUN bundle install

COPY . .

EXPOSE 3000

CMD rails server -b 0.0.0.0
