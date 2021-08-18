class Anime < ApplicationRecord
  has_many :anime_voices
  belongs_to :user
  belongs_to :genre

  has_many :anime_urls

  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
  # ユーザidがFavoritesテーブル内に存在（exists?）するか確認する
end
