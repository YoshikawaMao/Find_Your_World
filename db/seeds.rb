# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create(name: 'example', email: 'example@example.com', password: 'passw@rd')

user = User.create(name: 'example', email: 'example@example.com', password: 'passw@rd')


# ここに声優名とジャンルと出演作品追加していく
voices = [
  {name: '神谷浩史', anime: [
    {genre: 'a', name: 'Bake'},
    {genre: 'b', name: 'Natsume'}
  ]},
  {name: '小野大輔', anime: [
    {genre: 'a', name: 'Shingeki'},
    {genre: 'a', name: 'Kuro'}
  ]},
  {name: '井上和彦', anime: [
    {genre: 'b', name: 'Natsume'},
    {genre: 'a', name: 'Naruto'}
  ]}
]

# voice.each do |name|
#  data = Voice.create(name: name)
# end

voices.each do |data|
  # 声優さんの名前でクリエイト
  voice = Voice.find_or_create_by(name: data[:name]) # koko
  # puts data[:name]
  data[:anime].each do |anime|
    # アニメの名前でクリエイト
    genre = Genre.find_or_create_by(name: anime[:genre])
    anime_title = Anime.find_or_create_by(user_id: user.id, title: anime[:name], genre_id: genre.id) # koko
    AnimeVoice.find_or_create_by(anime_id: anime_title.id, voice_id: voice.id) # koko
    # puts "anime: #{anime}"
  end
  # puts '----'
end

