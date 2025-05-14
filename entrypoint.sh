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
  #Rails復習.mdのコピー
  cp /rails-temp/Railsの復習用.md .
  #Tailwindのビルドコマンド.mdのコピー
  cp /rails-temp/Tailwindのビルドコマンド.md .
  #tailwind.config.jsのコピー
  cp /rails-temp/tailwind.config.js .
  #application.html.erbのコピー
  cp /rails-temp/application.html.erb ./app/views/layouts/application.html.erb
  #application.tailwind.cssのコピー
  cp /rails-temp/application.tailwind.css ./app/assets/stylesheets/application.tailwind.css
  #TailwindとdaisyUIの使い方.mdのコピー
  cp /rails-temp/tailwindとdaisyUIの勉強.md .
  #自作スニペットのコピー
  cp /rails-temp/.vscode/snippets/css.code-snippets .vscode/css.code-snippets
  cp /rails-temp/.vscode/snippets/erb.code-snippets .vscode/erb.code-snippets
  cp /rails-temp/.vscode/snippets/html.code-snippets .vscode/html.code-snippets
  cp /rails-temp/.vscode/snippets/ruby.code-snippets .vscode/ruby.code-snippets
fi


# tailwindcssが存在しなければダウンロードする(必須)
if [ ! -f /usr/local/bin/tailwindcss ]; then
  ARCH=$(uname -m)
  if [ "$ARCH" = "x86_64" ]; then
    echo "Downloading TailwindCSS for x86_64..."
    curl -o /usr/local/bin/tailwindcss -L https://github.com/tailwindlabs/tailwindcss/releases/latest/download/tailwindcss-linux-x64
  elif [ "$ARCH" = "aarch64" ]; then
    echo "Downloading TailwindCSS for ARM64..."
    curl -o /usr/local/bin/tailwindcss -L https://github.com/tailwindlabs/tailwindcss/releases/latest/download/tailwindcss-linux-arm64
  else
    echo "Unsupported architecture: $ARCH"
    exit 1
  fi
  chmod +x /usr/local/bin/tailwindcss
  echo "✔️ TailwindCSS installed successfully!"
fi

# daisyUIが存在しなければダウンロードする（必須）
cd ./app/assets/stylesheets
if [ ! -f "daisyui.js" ]; then
  echo "Downloading daisyUI..."
  curl -sLO https://github.com/saadeghi/daisyui/releases/latest/download/daisyui.js
fi

if [ ! -f "daisyui-theme.js" ]; then
  echo "Downloading daisyUI Theme..."
  curl -sLO https://github.com/saadeghi/daisyui/releases/latest/download/daisyui-theme.js
fi


# foremanのインストール（今は使ってないけど）
if ! gem list -i foreman > /dev/null 2>&1; then
  echo "Installing foreman..."
  gem install foreman --no-document
fi

# 毎回Railsサーバー起動前にpidファイル削除（←ここは毎回必要）
rm -f tmp/pids/server.pid

exec "$@"
