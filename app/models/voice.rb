class Voice < ApplicationRecord
  has_many :anime_voices
  # belongs_to :user


  # def self.search(search)
  #   if search
  #     Voice.where(['name LIKE ?', "%#{search}%"])
  #   else
  #     Voice.all
  #   end
  # end

end
