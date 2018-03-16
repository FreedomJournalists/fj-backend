class CreateCampaigns < ActiveRecord::Migration[5.1]
  def change
    create_table :campaigns do |t|
      t.string :title
      t.string :description
      t.float :money_raised
      t.integer :goal

      t.timestamps
    end
  end
end
