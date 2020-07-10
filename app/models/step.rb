class Step < ApplicationRecord
  include PgSearch::Model
  pg_search_scope :search_by_location_and_title,
    against: [:location, :title],
    associated_against: {
      trip: [:title]
    }

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
  belongs_to :trip
  has_many :blocks, dependent: :destroy

  validates :title, presence: true, length: { minimum: 2 }
  validates :location, presence: true
  validates :nb_of_days, presence: true

  accepts_nested_attributes_for :blocks, reject_if: :all_blank

  def cover_picture_key
    block_photos = blocks.find_by(mediatype: "photos")
    if block_photos
      block_photos.files.first.key
    else
      "bxeesxc0j8voxhzw2krz"
    end
  end

end
