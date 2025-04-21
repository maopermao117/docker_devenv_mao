#!/bin/bash
set -e

# Railsアプリがまだ無いなら作るここは変更しない.
if [ ! -f "Gemfile" ]; then
  echo "Rails app not found. Creating..."
  rails new . --force --no-deps --database=postgresql --skip-docker
  cp /rails-template/config/database.yml ./config/database.yml
fi

# 毎回Railsサーバー起動前にpidファイル削除（←ここは毎回必要）
rm -f tmp/pids/server.pid

# DockerfileのCMD ["rails", "server", "-b", "0.0.0.0"] を実行
exec "$@"
