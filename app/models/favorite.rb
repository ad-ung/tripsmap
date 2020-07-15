class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :step

  validates :step_id, uniqueness: { scope: :user_id }
end
