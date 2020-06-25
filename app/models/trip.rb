class Trip < ApplicationRecord
  belongs_to :user
  has_many :steps, dependent: :destroy

  has_one_attached :cover_picture

  validates :title, presence: true, length: { minimum: 8 }
end
