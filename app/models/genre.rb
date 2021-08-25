class Genre < ApplicationRecord
  has_many :animes, dependent: :destroy
  # ジャンル削除すると紐づくアニメも消える
  validates :name, presence: true
end
