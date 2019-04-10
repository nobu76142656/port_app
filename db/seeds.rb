@user = User.new
@user.name = 'aoki'
@user.email = 'aoki@email.com'
@user.password_digest = '111111'
@user.save

@user = User.new
@user.name = 'nitta'
@user.email = 'nitta@email.com'
@user.password_digest = '111111'
@user.save

@user = User.new
@user.name = 'siba'
@user.email = 'siba@email.com'
@user.password_digest = '111111'
@user.save

@place = Place.new
@place.name = 'ルーツ'
@place.lat = '35.442739'
@place.lng = '139.634443'
@place.save

@place = Place.new
@place.name = '長野市'
@place.lat = '36.648708'
@place.lng = '138.192307'
@place.save

@place = Place.new
@place.name = '金沢市'
@place.lat = '36.562500'
@place.lng = '136.646805'
@place.save

@place = Place.new
@place.name = '奈良市'
@place.lat = '34.679359'
@place.lng = '135.836105'
@place.save

@place = Place.new
@place.name = '岡山市'
@place.lat = '34.665218'
@place.lng = '133.922501'
@place.save

@place = Place.new
@place.name = '福岡市'
@place.lat = '33.579788'
@place.lng = '130.402405'
@place.save