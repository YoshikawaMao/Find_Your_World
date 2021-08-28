class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :animes
  has_many :messages
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favoried_animes, through: :favorites, source: :anime
  # has_many :voices

  validates :name, presence: true
end
