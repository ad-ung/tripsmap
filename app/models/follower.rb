class Follower < ApplicationRecord
  belongs_to :user
  has_one_attached :photo
  has_many :steps, through: :user

  validates :follower_pseudo, uniqueness: { scope: [:user_id] }
end
