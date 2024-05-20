class Album < ApplicationRecord

    has_many_attached :photos

    has_one_attached :cover_image

end
