class CreatePostCosmes < ActiveRecord::Migration[6.1]
  def change
    create_table :post_cosmes do |t|

      t.timestamps

    end
  end
end
