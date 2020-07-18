class Follower < ApplicationRecord
  belongs_to :user

  validates :follower_pseudo, uniqueness: { scope: [:user_id] }
end
