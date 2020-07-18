class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :trips
  has_many :steps, through: :trips
  has_many :followers
  validates :pseudo, presence: true, uniqueness: true
  has_one_attached :avatar
  has_many :messages
  has_many :conversations, foreign_key: :sender_id
end
