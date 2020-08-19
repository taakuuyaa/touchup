FROM ruby:2.7.1

# rails consoleで日本語使うため設定
# https://qiita.com/kbaba1001/items/39f81156589dd9a0d678#comment-6ed4ff57c5a4263b36a8
ENV LANG C.UTF-8
# コンテナ内のタイムゾーンを変更する。
# https://blog.ryou103.com/post/rails-docker-timezone/
ENV TZ Asia/Tokyo

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
    && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
    && apt-get update -qq && apt-get install -y nodejs yarn wget

ENV ENTRYKIT_VERSION 0.4.0

RUN wget https://github.com/progrium/entrykit/releases/download/v${ENTRYKIT_VERSION}/entrykit_${ENTRYKIT_VERSION}_Linux_x86_64.tgz \
    && tar -xvzf entrykit_${ENTRYKIT_VERSION}_Linux_x86_64.tgz \
    && rm entrykit_${ENTRYKIT_VERSION}_Linux_x86_64.tgz \
    && mv entrykit /bin/entrykit \
    && chmod +x /bin/entrykit \
    && entrykit --symlink

WORKDIR /app
COPY Gemfile* /app/
COPY . /app

ENTRYPOINT ["prehook", \
                "bundle install", "--", \
            "switch", \
                "pwd=pwd",\
                "migrate=rails db:migrate",\
                "version=ruby -v", "--" \
]

CMD ["rails", "server", "-b", "0.0.0.0"]
