#!/bin/bash
set -e

# Railsアプリがまだ無いなら作るここは変更しない.
if [ ! -f "Gemfile" ]; then
  echo "Rails app not found. Creating..."
  rails new . --force --no-deps --database=postgresql --skip-docker
  # VSCode設定フォルダがなければ作成してからコピー
  mkdir -p .vscode
  cp /rails-temp/.vscode/settings.json .vscode/settings.json
  cp /rails-temp/.vscode/extensions.json .vscode/extensions.json
  #データベース設定ファイルのコピー
  cp /rails-temp/database.yml ./config/database.yml
  #ルーティングファイルのコピー
  cp /rails-temp/routes.rb ./config/routes.rb
  #homeコントローラーのコピー
  cp /rails-temp/home_controller.rb ./app/controllers/home_controller.rb
  #hellow.html.erbのコピー
  mkdir -p ./app/views/home
  cp /rails-temp/hellow.html.erb ./app/views/home/hellow.html.erb
fi

# 毎回Railsサーバー起動前にpidファイル削除（←ここは毎回必要）
rm -f tmp/pids/server.pid

# DockerfileのCMD ["rails", "server", "-b", "0.0.0.0"] を実行
exec "$@"
