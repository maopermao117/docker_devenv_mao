# Rails7.1.5の操作方法ガイド

## link_to　について
変更前
link_to(第一引数はvalue, 第二引数はリンク先, 第三引数は{method: "post"}など)
変更後
link_to "表示テキスト", "パス", オプションで通信方式など,　あとはclass=""など
例
<%= link_to "ログイン", "/login", class: "login-link" %>


## redirect_to について
変更前
redirect_to("パス")
変更後
redirect_to "パス"
例
redirect_to "/login"


## form_tag　について
### Progateで使ったモデルなしフォーム
変更前
form_tag("パス") do
変更後
form_with url: "パス",method: :getやpostなど, local: true do
説明: ここのlocal:trueはjavascript使わないならtrueにしとけばおけ
例
form_with url: "/login", method: :post, local: true do

#### Progateで使ってないモデル付きフォーム（モデルにデータ保存するときに使うべき！！！！！）
##### html.erbでは
form_with model: @モデル名の小文字, local: true do |f|
例
<%= form_with model: @user, local: true do |f| %>
  <%= f.text_field :email %>
  <%= f.password_field :モデルのカラム名 %>
  <%= f.submit "登録" %>
<% end %>

##### コントローラーでは
def new
  @user = User.new
end

def create
  @user = User.new(user_params)  # ← ここがポイント！
  if @user.save
    redirect_to root_path
  else
    render :new
  end
end

説明: モデルのインスタンスがfに代入され、インスタンスに　:モデルのカラム名　とすることで自動でインスタンスに格納される
そしてコントローラ内で使う時は　form_withの@モデル名の小文字_params　で呼び出せる(user_params)
命名ルールで決まってる!!

####　注意点
private

def user_params
  params.require(:user).permit(:email, :password)
end
これを書かないと使えない！


## 📝 Railsのフォームヘルパーまとめ（*_tag系）

### <input type="text" name="〇〇"> 一行のテキスト入力
<%= text_field_tag :パラメータ, valueを入れれる, placeholder: "ユーザーネーム" %>
説明：第二引数はvalueを入れれるが、いらないならnilで

### <input type="password" name="〇〇">　パスワードの入力
<%= password_field_tag :パラメータ, valueを入れれる, placeholder: "パスワード" %>
説明：第二引数はvalueを入れれるが、いらないならnilで

### <textarea name="〇〇">...</textarea> 複数行のテキスト入力
<%= text_area_tag :パラメータ, valueを入れれる, rows: 5, cols: 40, placeholder: "自己紹介を書いてね" %>
説明：第二引数はvalueを入れれるが、いらないならnilで

### <input type="file" name="〇〇"> ファイルアップロードボタン
<%= file_field_tag :パラメータ %>
説明：stringデータじゃなくてオブジェクトデータとして渡されるので特殊操作が必要！！
####　特殊操作
form_withの第二引数以降に　multipart: true　を書かないとデータをpostとかできない！！

### <input type="submit" value="送信とか">　送信ボタン
<%= submit_tag "登録する" %>
説明：


