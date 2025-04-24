#!/bin/bash
set -e

# Railsアプリがまだ無いなら作るここは変更しない.
if [ ! -f "Gemfile" ]; then
  echo "Rails app not found. Creating..."
  rails new . --force --no-deps --database=postgresql --skip-docker --css=tailwind
  cp /rails-temp/database.yml ./config/database.yml
  #tailwind設定用ファイル.
  cp /rails-temp/application.tailwind.css ./app/assets/stylesheets/application.tailwind.css
  #説明ファイルのコピー
  cp /rails-temp/Tailwind導入解説.md ./
  #ルーティングファイルのコピー
  cp /rails-temp/routes.rb ./config/routes.rb
  #homeコントローラーのコピー
  cp /rails-temp/home_controller.rb ./app/controllers/home_controller.rb
  #hellow.html.erbのコピー
  mkdir -p ./app/views/home
  cp /rails-temp/hellow.html.erb ./app/views/home/hellow.html.erb
  ./bin/bundle add tailwindcss-ruby
  ./bin/bundle add tailwindcss-rails
  ./bin/rails tailwindcss:install
fi

# 毎回Railsサーバー起動前にpidファイル削除（←ここは毎回必要）
rm -f tmp/pids/server.pid

# DockerfileのCMD ["rails", "server", "-b", "0.0.0.0"] を実行
exec "$@"
