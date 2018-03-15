class AddIndexToUsers < ActiveRecord::Migration[5.1]
  def change
      add_index :users, [:nickname, :email], unique: true
  end
end
