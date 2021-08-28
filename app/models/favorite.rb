class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :anime

  validates_uniqueness_of :anime_id, scope: :user_id
end
