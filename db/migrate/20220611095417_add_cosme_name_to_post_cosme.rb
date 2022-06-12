class AddCosmeNameToPostCosme < ActiveRecord::Migration[6.1]
  def change
    add_column :post_cosmes, :cosme_name, :string
  end
end
