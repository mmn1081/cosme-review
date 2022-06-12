class PostCosme < ApplicationRecord
    has_one_attached :image
    belongs_to :customer#post_cosmeに属する

    def get_image
        if image.attached?
          image
        else
          'no_image.jpg'
        end
    end

end
