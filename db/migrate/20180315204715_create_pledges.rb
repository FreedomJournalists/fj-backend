class CreatePledges < ActiveRecord::Migration[5.1]
  def change
    create_table :pledges do |t|
      t.float :money
      t.string :message

      t.timestamps
    end
  end
end
