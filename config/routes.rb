Rails.application.routes.draw do
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  # root to: 'tozans#index'
  root to: 'users#index'
  resources :tozans
  resources :users
end

# bin/rails g model Tozan mountain:string elevation:string content:text date:date

# Tozanモデル
# ID:id
# 山の名前:mountain:string
# 標高:elevation:string
# 説明:content:text
# 登った日:date:date

# bin/rails g controller Tozans index show new edit

# NOT NULL制約
# bin/rails g migration ChangeTozansNameNotNull


# ログイン機能
# Railsではコントローローラからsessionというメソッドを呼び出すことでセッションにアクセス。
# session[:user_id] = user.id のように任意のキーに値を格納できる。

# 誰もログインしていない状態。session[:uesr_id]がnil
# 誰かがログインしている状態。session[:user_id]にログイン中のユーザーのIDが入っている。

# セッションに似た仕組みとしてCookiesがある。セッションがアプリケーション側で独自に実現
# される仕組みであるのに対して、Cookiesはブラウザとwebサーバでやりとりされる。

# Railsではセッションは、cookiesによってやりとりされるセッションIDをキーにして保管される。
# そのためブラウザ側で対応するCookieデータを消せばセッションはリセットされる。

# bin/rails g model user name:string email:string password_digest:string

# bin/rails g controller Users new edit show index

# bin/rails g controller Sessions new


# 編集(edit)と更新(update)はログインしているユーザーのみ可能にする
#