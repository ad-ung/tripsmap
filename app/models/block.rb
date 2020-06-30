class Block < ApplicationRecord
  belongs_to :step

  has_many_attached :files
  validates :mediatype, inclusion: { in: ["photos", "video", "text"] }
end
