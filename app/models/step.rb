class Step < ApplicationRecord
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
  belongs_to :trip
  has_many :blocks, dependent: :destroy, inverse_of: :step

  validates :title, presence: true, length: { minimum: 2 }
  validates :location, presence: true
  validates :nb_of_days, presence: true

  accepts_nested_attributes_for :blocks, reject_if: :all_blank, allow_destroy: true

  def cover_picture_key
    block_photos = blocks.find_by(mediatype: "photos")
    if block_photos
      block_photos.files.first.key
    else
      "bxeesxc0j8voxhzw2krz"
    end
  end
end
