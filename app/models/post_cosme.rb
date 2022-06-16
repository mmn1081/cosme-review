class PostCosme < ApplicationRecord
    has_one_attached :image

    belongs_to :customer#post_cosmeに属する
    has_many :comments, dependent: :destroy#コメント機能とアソシエーション

  def get_image#投稿画像
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image
  end

end
