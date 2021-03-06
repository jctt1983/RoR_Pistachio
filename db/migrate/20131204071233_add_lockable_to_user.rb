class AddLockableToUser < ActiveRecord::Migration
  def change
    add_column :users, :failed_attempts, :integer
    add_column :users, :unlock_token, :string
    add_column :users, :locked_at, :datetime

    add_index :users, :unlock_token
  end
end
