class Follower < ApplicationRecord
  belongs_to :user
  has_one_attached :photo

  validates :follower_pseudo, uniqueness: { scope: [:user_id] }
end
