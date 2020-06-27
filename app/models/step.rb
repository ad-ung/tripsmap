class Step < ApplicationRecord
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
  belongs_to :trip
  has_many :blocks, dependent: :destroy

  has_one_attached :cover_picture

  validates :title, presence: true, length: { minimum: 8 }
  validates :location, presence: true
  validates :nb_of_days, presence: true
end
