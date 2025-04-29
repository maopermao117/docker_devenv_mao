##　TailwindとdaisyUIの使い分けおすすめ！

よく使うコンポーネントは**daisyUI**を使おう！

daisyUIで使うのは
ボタン、テキストフィールド、セレクトボックス、トグルスイッチ、チェックボックス、アラート、モーダル
> この辺はtailwindで書いたら大変だから丸投げしよう！

tailwind使うのは
並び・位置・間隔系かな

その前提で以下のtailwindとdaisyUIの使い方を説明しときます！

## Tailwind編

### 子要素を中央に置きたいなら
flex justify-center

### ブロック要素を等間隔に横並べしたい時
flex justify-around

### paddingとmarginの使い方
paddingはpを使う。
marginはmを使う
方向性指定方法
t: top
r: right
b: bottom
l: left
x: 水平方向（rとl）
y: 垂直方向 (tとb)

基本４の倍数でしていする。4で1rem（１文字分ほんとは16px）だから！！後ろの数字指定は
ex pt-4とかで指定する感じ

###　textのサイズ指定
公式ドキュメントのofont-sizeを参照
よく使うのは
text-〇〇　って感じで指定する

### textの文字と文字の高さ間隔指定
公式ドキュメントのline-heightを参照
よく使うのは
leading-〇〇　って感じ

### textの文字と文字の横の間隔指定
公式ドキュメントのletter spacingを参照
よく使うのは
tracking-normalとかtracking-wideとか使う

### テキストの寄せの指定
公式ドキュメントのtext-alignを参照
よく使うのは
text-leftとかtext-centerとかtext-rightとか　簡単！

### 色の指定システム（原色はNGなので300-500辺りを使うと目に優しいいい感じになる）
色はcolorsを見たら使いたい色がわかるからおすすめ！

基本色変えるのは、**文字、線、背景**　が多い

#### テキストの色指定方法
公式ドキュメントの　Typographyのcolor を見るといいよ！
よく使うのは
text-red-500　みたいな感じ
text-〇〇-300 とかかな　色はcolorsで色々あるよ！

#### 線の色指定方法
公式ドキュメントの　border-color　を見てみて
border-〇〇　で線の太さ指定して、その後ろに border-色-濃さ　をしてい！
border-4 border-indigo-500　これだと線が要素（方向指定してないので四角でつくので）
よく使うのは
border-b-4 border-indigo-500 とかで下に線出して指定かな？