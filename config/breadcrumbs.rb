# ルート
crumb :root do
  link "ホーム", root_path
end

# # ユーザー詳細
# crumb :user do |user|
#   link "#{user.nickname}", user_path(user)
# end

# # マイページ
# crumb :mypage do |user|
#   link "マイページ", user_path(user)
# end

# マイページ>ログアウト
crumb :logout do
  link "ログアウト", logout_path
  parent :mypage
end

# # マイページ>お知らせ
# crumb :notification do
  
#   parent :mypage
# end

# # マイページ>やることリスト
# crumb :todo do
  
#   parent :mypage
# end

# # マイページ>プロフィール
# crumb :profile do
#   link "プロフィール", edit_user_path
#   parent :mypage
# end

# # マイページ>支払い方法
# crumb :purchase do
#   link "支払い方法", purchase_index_path
#   parent :mypage
# end

# # カテゴリー一覧
# clumb :category do
#  link "カテゴリー一覧", category_path
# end
