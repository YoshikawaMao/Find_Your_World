class AnimeUrl < ApplicationRecord
  belongs_to :anime

  validates :address, presence: true
end
