# 📦 和田ゼミ Rails開発環境（Docker版）

このプロジェクトは、**和田ゼミ生向け**に作成した、**Ruby on Rails を簡単に始められる開発テンプレート**です。

> 💻 MacでもWindowsでも動く！Dockerで構築したから、誰でも同じ環境で開発できる！

---

## 🛠 構成概要

- Ruby 3.2.8  
- Rails 7.1.3  
- PostgreSQL 15  
- Docker + Docker Compose を使用  
- 初回実行時に `rails new` でアプリ自動作成！

---

## 🛠 事前準備（Mac / Windows）

### ◾ Mac の人
- Docker Desktop をインストール 👉 [公式サイト](https://www.docker.com/products/docker-desktop/)

### ◾ Windows の人
1. Docker Desktop をインストール 👉 [公式サイト](https://www.docker.com/products/docker-desktop/)
2. WSL2を有効化する（めっちゃ大事）  
　👉 [WSL2のセットアップ方法](https://learn.microsoft.com/ja-jp/windows/wsl/install)

> ⚠️ WSLが「1」だとうまく動かないので、必ずWSL2にアップグレードしておいてね！

---

## 📁 フォルダ構成の準備

1. フォルダを二つ用意します：

| フォルダ名 | 役割 |
|------------|------|
| `rails_setup` | 環境構築用（このテンプレのファイル一式を入れる） |
| `rails_dev` | アプリ開発用（実際のRailsアプリが入る） |

2. このフォルダ一式を `rails_setup` にそのままコピーします

---

## 🧰 docker-compose.yml の設定（要チェック）

```yaml
volumes:
  - /Users/mao/Desktop/rails_dev:/app
```

この前半の `/Users/mao/Desktop/rails_dev` の部分は、自分のパソコンに作った開発フォルダのパスに必ず変更して!

- Mac の人 → Finderでフォルダを右クリック → パスをコピー
- Windows の人 → フォルダをエクスプローラーで開いてパスをコピー

---

## 🚀 起動コマンド（初回）

ターミナルやコマンドプロントで `rails_setup` フォルダに移動して、下のコマンドを実行！

```bash
docker compose up --build
```

これで自動的に：

- Railsアプリが作成される  
- データベース(PostgreSQL)もセットアップされる  
- サーバーが起動する  

---

## ✅ コンテナが起動してるか確認しよう！

1. Docker Desktop を開く  
2. 「Containers」タブに「rails」というプロジェクトが表示される  
3. その中に：
   - `rails-web-1`
   - `rails-db-1`

の2つのコンテナがあれば完璧！

---

## 🧑‍💼 作業の進め方（VSCode編）

1. VSCodeを開く  
2. 左サイドバーにある「🧃 リモートエクスプローラー」をクリック  
3. `rails-web-1` の横にある ▶ を押すとコンテナの中に入れる  
4. あとは通常通り Rails の開発ができる！

---

## 📅 注意事項・ヒント

- `rails_dev` の中身は実時にコンテナと同期されます
- 起動し直したいときは `docker compose down -v` でDBも初期化
- VSCode Remote Containers 拡張機能を入れておくと便利

---

## 📣 最後に

- このテンプレは、ゼミ生が**「環境構築で詰まらず、すぐにRailsを始められるように」**設計してます。
- 不明点があれば、先輩かLINEで気軽に聞いてね！

---

## 作成者

和田ゼミ生：まお 
更新日：2025年4月16日
