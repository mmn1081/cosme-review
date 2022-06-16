class Comment < ApplicationRecord
  
  belongs_to :customer
  belongs_to :post_cosme

  validates :comment, presence: true
end
