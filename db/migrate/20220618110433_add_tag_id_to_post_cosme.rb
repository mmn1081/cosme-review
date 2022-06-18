class AddTagIdToPostCosme < ActiveRecord::Migration[6.1]
  def change
    add_column :post_cosmes, :tag_id, :integer
  end
end
