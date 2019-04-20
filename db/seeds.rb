#csvファイルを扱うためのgemを読み込む

# =======================================================================
# 郵便番号データベースのCVSからrailsデータベースに書き込む
#
#foreachは、ファイル（hoge.csv）の各行を引数として、ブロック(do~endまでを範囲とする『引数のかたまり』)を繰り返し実行する
#rowには、読み込まれた行が代入される

require "csv"
CSV.foreach('db/KEN_ALL.CSV',encoding: 'Shift_JIS:UTF-8') do |row|
  # Jzipテーブルの各カラムに、各行のn番目の値を代入している。
  Jzip.create(:code => row[2], :pref => row[6], :city => row[7], :address => row[8])
end

# rails g model Jzip code:string pref:string city:text address:text
# 郵便番号 都道府県名 市区町村名 町域名    検索用アドレス
# code    pref     city     address  alladdress

# 必要なデータがCVSファイルの何番目のカラムかを示す定数
# CSV_COLUMN = {code: 2, pref: 6, city: 7, addr: 8}
# =======================================================================

# @user = User.new
# @user.name = 'aoki'
# @user.email = 'aoki@email.com'
# @user.password_digest = '111111'
# @user.save

# @user = User.new
# @user.name = 'nitta'
# @user.email = 'nitta@email.com'
# @user.password_digest = '111111'
# @user.save

# @user = User.new
# @user.name = 'siba'
# @user.email = 'siba@email.com'
# @user.password_digest = '111111'
# @user.save

# @place = Place.new
# @place.address = 'ルーツ'
# @place.lat = '35.442739'
# @place.lng = '139.634443'
# @place.address = '横浜市'
# @place.save

# @place = Place.new
# @place.address = '長野市'
# @place.address = '長野市'
# @place.save

# @place = Place.new
# @place.address = '金沢市'
# @place.lat = '36.562500'
# @place.lng = '136.646805'
# @place.save

# @place = Place.new
# @place.address = '奈良市'
# @place.lat = '34.679359'
# @place.lng = '135.836105'
# @place.save

# @place = Place.new
# @place.address = '岡山市'
# @place.lat = '34.665218'
# @place.lng = '133.922501'
# @place.save

# @place = Place.new
# @place.address = '福岡市'
# @place.lat = '33.579788'
# @place.lng = '130.402405'
# @place.save