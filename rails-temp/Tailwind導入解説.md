# Tailwind CSS 導入解説（Rails 用）

## 🌟 Tailwind CSS とは？

Tailwind CSS は「ユーティリティファースト」の CSS フレームワークです。  
従来のように CSS クラスを自作するのではなく、事前に用意された小さなユーティリティクラスを組み合わせて UI を構築します。

### ✅ Tailwind を使うメリット

- **CSS を書かずにデザインできる**  
  HTML 中に直接スタイル指定できるので、CSS ファイルが散らからない。
- **クラス名で即見た目が分かる**  
  例えば `bg-red-500 text-white rounded-lg` のように、どんな見た目かがクラス名で一目瞭然。

- **レスポンシブも簡単**  
  `sm:`, `md:`, `lg:` などでレスポンシブ対応もすぐに可能。

- **Rails との親和性も高い**  
  `tailwindcss-rails` という Gem で簡単に Rails プロジェクトに統合できる。

---

## 🛠️ Tailwind 導入手順

自動でインストールする設定にしていますが、動かないなら以下をコピペして貼り付けて

```bash
./bin/bundle add tailwindcss-ruby
./bin/bundle add tailwindcss-rails
./bin/rails tailwindcss:install
```
