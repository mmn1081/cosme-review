class AddTagIdToPostCosme < ActiveRecord::Migration[6.1]
  def change
    add_reference :post_cosmes, :tag, foreign_key: true
  end
end
