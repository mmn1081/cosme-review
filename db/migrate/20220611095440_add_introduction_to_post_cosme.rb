class AddIntroductionToPostCosme < ActiveRecord::Migration[6.1]
  def change
    add_column :post_cosmes, :introduction, :text
  end
end
