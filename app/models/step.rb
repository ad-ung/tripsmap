class Step < ApplicationRecord
  belongs_to :trip
  has_many :blocks, dependent: :destroy

  # has_one_attached :cover_picture

  validates :title, presence: true, length: { minimum: 2 }
  validates :location, presence: true
  validates :nb_of_days, presence: true

  def cover_picture_key
    block_photos = blocks.find_by(mediatype: "photos")
    if block_photos
      block_photos.files.first.key
    else
      "bxeesxc0j8voxhzw2krz"
    end
  end
end
