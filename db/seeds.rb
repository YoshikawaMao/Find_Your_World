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
    {genre: 'a', name: '化物語'},
    {genre: 'b', name: '夏目友人帳'}
  ]},
  {name: '小野大輔', anime: [
    {genre: '', name: '進撃の巨人'},
    {genre: '', name: '黒執事'}
  ]},
  {name: '井上和彦', anime: [
    {genre: '', name: '夏目友人帳'},
    {genre: '', name: 'NARUTO -ナルト-'}
  ]},
  {name: '下野紘', anime: [
    {genre: '', name: '鬼滅の刃'},
    {genre: '', name: 'うたの☆プリンスさまっ♪'}
  ]},
  {name: '梶裕貴', anime: [
    {genre: '', name: ''},
    {genre: '', name: ''}
  ]},
  {name: '中村悠一', anime: [
    {genre: '', name: ''},
    {genre: '', name: ''}
  ]},
  {name: '杉田智和', anime: [
    {genre: '', name: ''},
    {genre: '', name: ''}
  ]},
  {name: '内田雄馬', anime: [
    {genre: '', name: ''},
    {genre: '', name: ''}
  ]},
  {name: '内田真礼', anime: [
    {genre: '', name: ''},
    {genre: '', name: ''}
  ]},
  {name: '寺島拓篤', anime: [
    {genre: '', name: ''},
    {genre: '', name: ''}
  ]},
  {name: '宮野真守', anime: [
    {genre: '', name: ''},
    {genre: '', name: ''}
  ]},
  {name: '鬼頭明里', anime: [
    {genre: '', name: ''},
    {genre: '', name: ''}
  ]},
  {name: '松岡禎丞', anime: [
    {genre: '', name: ''},
    {genre: '', name: ''}
  ]},
  {name: '櫻井孝宏', anime: [
    {genre: '', name: ''},
    {genre: '', name: ''}
  ]},
  {name: '逢坂良太', anime: [
    {genre: '', name: ''},
    {genre: '', name: ''}
  ]},
  {name: '島﨑信長', anime: [
    {genre: '', name: ''},
    {genre: '', name: ''}
  ]},
  {name: '花江夏樹', anime: [
    {genre: '', name: ''},
    {genre: '', name: ''}
  ]},
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

