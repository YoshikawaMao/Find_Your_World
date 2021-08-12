class Anime < ApplicationRecord
  has_many :anime_voices
  belongs_to :user
  belongs_to :genre

  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  def self.search_for(content)
    Item.where('name LIKE ?', '%'+content+'%').or(Item.where(genre_id: content))
  end

end
