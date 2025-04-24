Rails.application.routes.draw do

  # ゼミ生用の開発環境できた！ってページ（必要なくなったら削除して大丈夫！）
  get "/" => 'home#hellow'

end
