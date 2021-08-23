class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :anime

  validates :comment_content, presence: true
end
