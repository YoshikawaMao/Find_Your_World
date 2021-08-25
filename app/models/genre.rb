class Genre < ApplicationRecord
  has_many :animes, dependent: :destroy

  validates :name, presence: true
end
