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

##　コントローラーとルーティング設定が終わったら動くか試してみて
<body class="bg-gray-100 min-h-screen flex items-center justify-center">

  <div class="bg-white p-6 rounded-xl shadow-lg space-y-4 text-center">
    <h1 class="text-2xl font-bold text-blue-600">Tailwind CSS テストページ</h1>
    <p class="text-gray-600">Tailwind CSSが正しく動いていれば、レイアウトや色が整っています。</p>
    <button class="bg-blue-500 hover:bg-blue-600 text-white px-4 py-2 rounded transition">
      テストボタン
    </button>
  </div>

</body>
