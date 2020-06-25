class Block < ApplicationRecord
  belongs_to :step

  has_many_attached :files
end
