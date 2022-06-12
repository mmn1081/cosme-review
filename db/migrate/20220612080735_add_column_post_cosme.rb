class AddColumnPostCosme < ActiveRecord::Migration[6.1]
  def change
    add_column :post_cosmes, :customer_id, :integer
  end
end
