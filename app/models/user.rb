class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :animes
  has_many :voices
  has_many :messages

  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
end
