class AddEvaluationToPostCosme < ActiveRecord::Migration[6.1]
  def change
    add_column :post_cosmes, :evaluation, :float
  end
end
