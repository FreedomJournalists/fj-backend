class AddDateToPledges < ActiveRecord::Migration[5.1]
  def change
    add_column :pledges, :date, :date
  end
end
