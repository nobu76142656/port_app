Rails.application.routes.draw do
  # GETはウェブサーバーからデータを取得する時に用い、POSTはウェブサーバーの状態を変更する時に用いる
  # アクションはブラウザーへのレスポンスを作成するためにビューを選ぶ。特に指定しなければアクションと同名のビューが選ばれる

  # ルーティング例
  # /aboutというパスをaboutアクションと結びつく。about_pathメソッドが/aboutを返すようになる。
  # get "about" => "top#about", as: "about"


  get 'jzips/index'
  # get root to: 'jzips#index'
  resources :jzips


  get root to: 'places#index'
  get 'places/index'
  get 'places/new'
  get 'places/create'
  get 'places/malti_places'
  # get 'places/:id'
  post 'places/create'
  post 'places/index'
  delete 'places/destroy'
  delete 'places/destroy_all'
  resources :places



  get 'primes/index', to: 'primes#index'
  get 'primes/show', to: 'primes#show'
  get 'primes/calcu', to: 'primes#calcu'


  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  # root to: 'users#index'
  resources :tozans
  resources :users
end

# 郵便番号住所モデル
# Jzip
# rails g model Jzip code:text pref:text city:text address:text
# rails g controller Jzips index

# 郵便番号 都道府県名 市区町村名 町域名  
# code    pref     city     address


# skip_before_action :login_required

# Rails5でGoogleMapsAPIを用い、複数のマーカーを表示する
# https://qiita.com/yamaotoko4177/items/30b72766d013904452fa
#
# rails g model Place latitude:float longitude:float
# rails g controller Places index
# place = Place.new(name: "ルーツ", latitude: 35.442739, longitude: 139.634443)


# 地名をマップ上に表示(未実装)
# https://qiita.com/komakomako/items/c467da03104d391f7520
#
# rails g model Spot latitude:float longitude:float

# googlemap apiをただ表示
# https://rikulog.com/programing/google-map-api/
#
# rails g controller Apis index
# rails destroy  controller Apis index

# prime (素数)コントローラー
#
# rails g controller Primes index show

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