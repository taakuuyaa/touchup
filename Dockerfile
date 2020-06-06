FROM ruby:2.7.1

# rails consoleで日本語使うため設定
# https://qiita.com/kbaba1001/items/39f81156589dd9a0d678#comment-6ed4ff57c5a4263b36a8
ENV LANG C.UTF-8

# コンテナ内のタイムゾーンを変更する。
# https://blog.ryou103.com/post/rails-docker-timezone/
ENV TZ Asia/Tokyo

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
    && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

# https://docs.docker.com/compose/rails/
RUN apt-get update -qq && apt-get install -y build-essential nodejs yarn

ENV APP_HOME /app
RUN mkdir $APP_HOME
WORKDIR $APP_HOME

COPY Gemfile* $APP_HOME/
RUN bundle install --jobs=4
COPY . $APP_HOME

EXPOSE 3000

RUN yarn install --check-files
RUN if ["${RAILS_ENV}" = "production"]; then bundle exec rails assets:precompile; fi

