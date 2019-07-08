crumb :root do
  link "メルカリ", root_path
end

crumb :mypages do
  link "マイページ", mypages_path
  parent :root
end

crumb :profile do 
  link "プロフィール", profile_mypages_path 
  parent :mypages
end

crumb :identification do 
  link "本人情報", identification_mypages_path 
  parent :mypages
end

crumb :logout do 
  link "ログアウト", logout_mypages_path 
  parent :mypages
end