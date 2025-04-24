# Tailwind CSS 導入解説（Rails用）

## 🌟 Tailwind CSSとは？

Tailwind CSSは「ユーティリティファースト」のCSSフレームワークです。  
従来のようにCSSクラスを自作するのではなく、事前に用意された小さなユーティリティクラスを組み合わせてUIを構築します。

### ✅ Tailwindを使うメリット

- **CSSを書かずにデザインできる**  
  HTML中に直接スタイル指定できるので、CSSファイルが散らからない。
  
- **クラス名で即見た目が分かる**  
  例えば `bg-red-500 text-white rounded-lg` のように、どんな見た目かがクラス名で一目瞭然。

- **レスポンシブも簡単**  
  `sm:`, `md:`, `lg:` などでレスポンシブ対応もすぐに可能。

- **Railsとの親和性も高い**  
  `tailwindcss-rails` というGemで簡単にRailsプロジェクトに統合できる。

---

## 🛠️ Tailwind導入手順

以下のコマンドをなぜか２回実行してください、、、じゃないとなぜか使えません、、、

./bin/bundle add tailwindcss-ruby
./bin/bundle add tailwindcss-rails
./bin/rails tailwindcss:install
