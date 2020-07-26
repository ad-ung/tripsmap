class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable

  has_many :trips
  has_many :steps, through: :trips
  has_many :followers
  validates :pseudo, presence: true, uniqueness: true
  has_one_attached :avatar

  def subscriptions_steps
    # steps = Follower.where(follower_pseudo: pseudo).map do |follower|
    #   follower.steps
    # end
    # steps.flatten
    Follower.where(follower_pseudo: pseudo).map(&:steps).flatten
  end
end
