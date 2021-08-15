class Anime < ApplicationRecord
  has_many :anime_voices
  belongs_to :user
  belongs_to :genre

  # has_one :anime_url

  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

end
