# 📦 和田ゼミ Rails 開発環境（Docker 版）

このプロジェクトは、**和田ゼミ生向け**に作成した、**Ruby on Rails を簡単に始められる開発テンプレート**です。

> 💻 Mac でも Windows でも動く！Docker で構築したから、誰でも同じ環境で開発できる！

---

## 🛠 構成概要

- Ruby 3.2.8
- Rails 7.1.3
- PostgreSQL 15
- Tailwind CSS v4（Rails 初期導入済み）
- Docker + Docker Compose を使用
- 初回実行時に `rails new` でアプリ自動作成！

> 🎨 Tailwind CSS は `rails new` 時に `--css=tailwind` オプションで導入済み。  
> 最新版の v4 をベースにしており、デザインカスタマイズがすぐに始められます。

---

## 🧑‍💻 まず最初に VSCode をインストールしよう

Visual Studio Code（通称 VSCode）は、これから開発に使うエディタです。  
以下のリンクから、自分の OS に合ったインストーラをダウンロードしてインストールしてね。

👉 [VSCode ダウンロードページ（公式）](https://code.visualstudio.com/)

---

### 🈁 VSCode を日本語化しよう（超重要）

VSCode をインストールした直後は、**英語表示**になっています。  
以下の手順でとりま日本語化にしよう！

1. VSCode を起動する
2. 左のバーにある「四角いアイコン（拡張機能）」をクリック
3. 検索欄に `ja` と入力する
4. 表示される **「Japanese Language Pack for Visual Studio Code」** をクリックしてインストール
5. インストール後、「再起動しますか？」と聞かれるので「はい」をクリック

> ✅ 再起動後、VSCode が日本語表示になるよ

---

## 🛠 Docker Desktop 準備（Mac / Windows）

### ◾ Mac の人

- Docker Desktop をインストール 👉 [公式サイト](https://www.docker.com/products/docker-desktop/)
  インストールが完了したら Mac の人は次のフォルダ構成の準備に進んでね

### ◾ Windows の人（ちょっと面倒、、、）

Windows で Docker を使うには、まず「WSL2（Windows Subsystem for Linux 2）」を有効にする必要があるよ。
順番を間違えると Docker Desktop が起動できずにエラーになるので、必ず下記の流れで進めてね！

#### ✅ STEP 1：PowerShell 　をインストール

1. 公式サイトにアクセス  
   👉 [PowerShell GitHub 公式リリースページ](https://github.com/PowerShell/PowerShell/releases/latest)
2. ページ内から自分の環境にあったインストーラーを選びます：

- Windows 用 `.msi` インストーラー（例：`PowerShell-7.x.x-win-x64.msi`）を選択

3. ダウンロードした `.msi` をダブルクリックしてインストール開始
   - 途中はすべて「次へ」で OK です（特別な設定は不要）
4. インストールが完了したら、スタートメニューで「PowerShell 7」と検索して起動！

5. PowerShell 7 を開いて、以下のコマンドを入力してバージョン確認：

```bash
$PSVersionTable.PSVersion
```

> ✅ バージョンが 7.x.x になっていれば準備完了！

#### ✅ STEP 1：WSL2 をインストール

1. スタートボタンを右クリック
2. 「Windows Terminal（管理者）」または「PowerShell（管理者）」を選択
3. 次のコマンドをコピペして Enter：

```bash
wsl --install
```

> 💡 このコマンドだけで WSL のインストールが始まります（デフォルトで WSL2）  
> ⚠️ 結構時間かかる時もあって、終わったら再起動してください！

#### ✅ STEP 2：WSL のバージョン確認

再起動後に、もう一度 PowerShell（管理者）を開いて、次のコマンドを入力してください：

```bash
wsl -v
```

出力で　 WSL バージョン: 2 　と表示れたら大丈夫！

> ⚠️ バージョンが１なら、次のステップの仮想化を有効化した後、また WSL2 を再インストールする必要があります

#### ✅ STEP 3：仮想化がオンになっているか確認

1. Ctrl + Shift + Esc でタスクマネージャーを開く
2. 「パフォーマンス」タブ → 「CPU」を選択
3. 右下に「仮想化：有効」と表示されていれば、STEP5 に進んでね！

> ⚠️ 「無効」と表示されていた場合、BIOS の設定で仮想化を有効にする必要があります

#### 🛠 BIOS で仮想化を有効にする方法

1. パソコンを再起動し、起動直後に F2 や Delete キーを連打して BIOS 設定を開く
2. 「Intel なら VT」や「AMD なら SVM」などの仮想化設定を Enabled（有効） に変更
3. 設定を保存して再起動

> 💡 設定項目はパソコンのメーカーによって異なります。「メーカー名 BIOS 仮想化」で検索すると見つかります

#### 🔁 STEP 4：仮想化オン後に WSL2 を再インストールしたい場合

仮想化を有効にしたら、念のためもう一度次のコマンドを実行しましょう：

```bash
wsl --install
```

もしくは、WSL2 を明示的にデフォルトに指定する場合は：

```bash
wsl --set-default-version 2
```

最後にもう一度 WSL のバージョンを確認して仮想化が有効になってるか確認しましょう！

#### 🐳 STEP 5：Docker Desktop をインストール

- Docker Desktop をインストール 👉 [公式サイト](https://www.docker.com/products/docker-desktop/)

---

## 🛠 Git のインストール（全員必須）

このテンプレートを GitHub から取得して使うために、まずは **Git** をインストールしてください。  
インストール後は、`git clone` コマンドを使って開発テンプレートをダウンロードできます。

---

### ◾ Mac の人

Mac には最初から Git が入っていることが多いですが、**古いバージョンであることが多いため、最新版のインストールを推奨**します。

---

#### 💡 推奨：公式サイトから最新版をインストール

👉 [Git 公式ダウンロードページ（git-scm.com）](https://git-scm.com/)

1. ページ右下の「Download for Mac」から macOS 用の Git を選択
2. Install **homebrew** if you don't already have it, then:の homebrew をクリックする
3. Install Homebrew の下のこんな感じのやつ

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

をコピーしてターミナルにペーストして Homebrew をインストールしてインストールできてるか確認してください

```bash
brew -v
```

4. Homebrew インストール後、brew を使って**Git**をダウンロードします

```bash
brew install git
```

3. 完了後、ターミナルで次を実行してバージョン確認：

```bash
git --version
```

> ✅ このようにバージョンが表示されれば、Git のインストール完了です！あとちょっと！！

---

### ◾ Windows の人

1. 下記のリンクから Git for Windows をダウンロードしてください：  
    👉 [Git for Windows（公式）](https://git-scm.com/download/win)

   > 基本 **64-bit Git for Windows Setup** を選択！

2. インストーラー **（Git-x.x.x-64-bit.exe）** を起動

3. 「Adjusting your PATH environment（PATH 環境変数の調整）」という画面が表示されるので、以下を必ず選択してください：

✅ Git from the command line and also from 3rd-party software

> 🔺 これを選ばないと、VSCode や PowerShell から git が認識されません！

4. その他の設定は基本的に「次へ」で問題なし

5. インストール後に `PowerShell` を開き、以下のコマンドで確認：

```bash
git --version
```

出力例：

```
git version 2.43.0.windows.1
```

> ✅ このようにバージョンが表示されれば、Git のインストール完了です！あとちょっと！！

---

## 📁 フォルダの準備と Git クローン手順

### ◾ Mac の人

> 💡 Mac なら「書類（＝ Documents）」フォルダに 2 つのフォルダを作成します（デスクトップ荒らされたくない人いるからね...）

1. VSCode（Visual Studio Code）を開く
2. 開始画面の下の「開く...」をクリック
3. 「書類（Documents）」フォルダを開く
4. 「新規フォルダ作成」で以下の 2 つを作成：

| フォルダ名    | 役割                                             |
| ------------- | ------------------------------------------------ |
| `rails_setup` | 環境構築用（このテンプレのファイル一式を入れる） |
| `rails_dev`   | アプリ開発用（実際の Rails アプリが入る）        |

5. rails_setup フォルダを開いて選択（ここで一旦作業するよー）

##### 💻 VSCode 内でターミナルを開こう

1. VSCode 右上の「角から 2 番目のアイコン（ターミナル）」をクリック
2. 下部にターミナルが表示されたら、すでに rails_setup フォルダの中にいるはず！
   表示例

```bash
(base) mao@〇〇 rails_setup %
```

> (base) mao@〇〇　この後ろに自分がいるディレクトリ（フォルダー）が表示されるよ！！大切！！

#### 🔽 GitHub からテンプレートをクローンする

次のコマンドをそのまま貼り付けて実行してください：

```bash
git clone https://github.com/maopermao117/docker_devenv_mao.git .
```

成功すると VSCode の拡張機能入れますか？的な通知が出ます！拡張機能入れてね！(後からでも入れれるようにリスト書いてるけどね)

> ✅ 最後の . は「このフォルダに中身をダウンロードするよー」って意味です
> ⚠️ すでに何かファイルがあるとうまくいかないことがあります。その場合は空の状態にしてください

#### 🛠 ターミナルが使えない場合の代替方法（mkdir で作成）

どうしても VSCode の操作が不安な場合は、ターミナルから直接作成しても OK です：(できる限り VSCode 使ってやってみてね！)

```bash
mkdir ~/Documents/rails_setup
mkdir ~/Documents/rails_dev
cd ~/Documents/rails_setup
git clone https://github.com/maopermao117/docker_devenv_mao.git .
```

> ✅ 上記の方法でも全く同じ結果になりますが、できるだけ VSCode から操作に慣れておくのがおすすめです！

### ◾ Windows の人

> 💡 Windows でも「ドキュメント」フォルダ内に 2 つのフォルダを作成します（ほんとはデスクトップでもいいけどねー）

1. VSCode（Visual Studio Code）を開く
2. 開始画面の下の「開く...」をクリック
3. 左側のサイドバーで「ドキュメント」フォルダを選択
4. 右クリック →「新規フォルダー作成」で以下の 2 つを作成：

| フォルダ名    | 役割                                             |
| ------------- | ------------------------------------------------ |
| `rails_setup` | 環境構築用（このテンプレのファイル一式を入れる） |
| `rails_dev`   | アプリ開発用（実際の Rails アプリが入る）        |

5. rails_setup フォルダを開いて選択（ここで一旦作業するよー）

##### 💻 VSCode 内でターミナルを開こう

1. VSCode 右上の「角から 2 番目のアイコン（ターミナル）」をクリック
2. 下部にターミナルが表示されたら、すでに rails_setup フォルダの中にいるはず！
   表示例

```bash
PS C:\Users\mao\Documents\rails_setup>
```

> **>**の直前に自分がいるディレクトリ（フォルダー）が表示されるよディレクトリ！！大切！！

#### 🔽 GitHub からテンプレートをクローンする

次のコマンドをそのまま貼り付けて実行してください：

```bash
git clone https://github.com/maopermao117/docker_devenv_mao.git .
```

成功すると VSCode の拡張機能入れますか？的な通知が出ます！拡張機能入れてね！(後からでも入れれるようにリスト書いてるけどね)

> ✅ 最後の . は「このフォルダに中身をダウンロードするよー」って意味です
> ⚠️ すでに何かファイルがあるとうまくいかないことがあります。その場合は空の状態にしてください

#### 🛠 ターミナルが使えない場合の代替方法（mkdir で作成）

どうしても VSCode の操作が不安な場合は、PowerShell から直接作成しても OK です：(できる限り VSCode 使ってやってみてね！)

```bash
mkdir "$env:USERPROFILE\Documents\rails_setup"
mkdir "$env:USERPROFILE\Documents\rails_dev"
cd "$env:USERPROFILE\Documents\rails_setup"
git clone https://github.com/maopermao117/docker_devenv_mao.git .
```

> ✅ 上記でも同じように環境が整いますが、できれば VSCode の操作に慣れておくと今後の開発にも役立ちます！

## 🧰 docker-compose.yml の設定（変更必須！！！！）

```yaml
volumes:
  - /Users/mao/Documents/rails_dev:/app_dev
```

この前半の `/Users/mao/Documents/rails_dev` の部分は、自分のパソコンに作った開発フォルダのパスに必ず変更して!

#### Mac の人 → Finder でフォルダを右クリック → パスをコピー

> - /Users/名前/Documents/rails_dev:/app_dev って感じになるかな（名前の部分は変更して、パスも確認してね！）

#### Windows の人 → フォルダをエクスプローラーで開いてパスをコピー

> - C:\Users\名前\Documents\rails_dev:/app_dev って感じになるかな（名前の部分は変更して、パスも確認してね！）

---

## 🚀 起動コマンド（初回）

ターミナルやコマンドプロントで `rails_setup` フォルダに移動して、下のコマンドを実行！

> VSCode で rails_setup フォルダ開いてると、ターミナルの部分に 〇〇 rails_setup ってなってるはず！！！

```bash
docker compose up --build
```

これで自動的に：

- Rails アプリが作成される
- データベース(PostgreSQL)もセットアップされる
- サーバーが起動する

---

## ✅ コンテナが起動してるか確認しよう！

1. Docker Desktop を開く
2. 「Containers」タブに「rails」というプロジェクトが表示される
3. その中に：
   - `rails-web-1`
   - `rails-db-1`

の 2 つのコンテナがあれば完璧！

---

## 🧑‍💼 作業の進め方（VSCode 編）

1. VSCode を開く
2. 左サイドバーにある「🧃 リモートエクスプローラー」をクリック
3. `rails-web-1` の横にある ▶ を押すとコンテナの中に入れる
4. あとは通常通り Rails の開発ができる！

---

## 📅 注意事項・ヒント

- `rails_dev` の中身は実時にコンテナと同期されます
- 起動し直したいときは `docker compose down -v` で DB も初期化
- VSCode Remote Containers 拡張機能を入れておくと便利

---

## 📣 最後に

- このテンプレは、ゼミ生が**「環境構築で詰まらず、すぐに Rails を始められるように」**設計してます。
- Docker Desktop が使えない!とかわからないことがあったら LINE かメール で気軽に聞いてね！
- メールアドレス maopermao117@gmail.com

---

## 作成者

和田ゼミ生：まお
更新日：2025 年 4 月 24 日
