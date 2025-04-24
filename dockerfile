#問題が検出されても一応安定版なので大丈夫.
FROM ruby:3.2.8

# タイムゾーン指定.
ENV TZ=Asia/Tokyo

# 必要なパッケージのインストール.
RUN apt-get update -qq && apt-get install -y \
  build-essential \
  libpq-dev \
  git \
  libyaml-dev \
  && rm -rf /var/lib/apt/lists/*

# Node.js + Yarn（この順番が大事）
RUN curl -sL https://deb.nodesource.com/setup_18.x | bash - \
  && apt-get install -y nodejs \
  && curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
  && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
  && apt-get update -qq \
  && apt-get install -y yarn

# Railsインストール.
RUN gem install rails -v 7.1.3 --no-document

# 作業ディレクトリ作成.
WORKDIR /app_dev

# entrypointスクリプトをコピー.
COPY entrypoint.sh /usr/bin/entrypoint.sh
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]

# 初回以外は通常Railsサーバーとして起動.
CMD ["rails", "server", "-b", "0.0.0.0"]
