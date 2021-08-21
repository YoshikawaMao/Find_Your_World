class Voice < ApplicationRecord
  has_many :anime_voices
  # belongs_to :user


  def self.search(search)
    return Voice.all unless search
    Voice.where('name LIKE(?)', "%#{search}%")
  end
end
