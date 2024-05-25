class Album < ApplicationRecord

    has_one_attached :cover_image
    has_many_attached  :photos
  
    validates :title, presence: true
    validates :description, presence: true

end
