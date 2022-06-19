class AddLockableToDevise < ActiveRecord::Migration[6.1]
  def change
    add_column :customers, :failed_attempts, :integer, default: 0, null: false
    add_column :customers, :unlock_token, :string
    add_column :customers, :locked_at, :datetime
    add_index :customers, :unlock_token, unique: true
  end
end
