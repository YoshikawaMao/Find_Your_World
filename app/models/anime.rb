class Anime < ApplicationRecord
  has_many :anime_voices, dependent: :destroy
  # ↑ここにdependent::destroy書くことで中間テーブルからもアニメ消すことできる
  belongs_to :user
  belongs_to :genre

  has_many :anime_urls, dependent: :destroy
  # アニメが削除されたらurlも消える

  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  has_many :favorited_users, through: :favorites, source: :user, dependent: :destroy

  validates :title, presence: true

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
  # ユーザidがFavoritesテーブル内に存在（exists?）するか確認する
end
