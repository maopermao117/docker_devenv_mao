#問題が検出されても一応安定版なので、、、大丈夫
FROM ruby:3.2.8

# 必要なパッケージのインストール
RUN apt-get update -qq && apt-get install -y \
  build-essential \
  libpq-dev \
  nodejs \
  yarn \
  git \
  libyaml-dev \
  && rm -rf /var/lib/apt/lists/*

# Railsインストール
RUN gem install rails -v 7.1.3 --no-document

# 作業ディレクトリ作成
WORKDIR /app

# entrypointスクリプトをコピー
COPY entrypoint.sh /usr/bin/entrypoint.sh
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]

# 初回以外は通常Railsサーバーとして起動
CMD ["rails", "server", "-b", "0.0.0.0"]
