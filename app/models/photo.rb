class Photo < ApplicationRecord
  belongs_to :album
  has_one_attached :image

  validates :image, presence: true
end
