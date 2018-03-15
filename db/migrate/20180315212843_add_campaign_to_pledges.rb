class AddCampaignToPledges < ActiveRecord::Migration[5.1]
  def change
    add_reference :pledges, :campaign, foreign_key: true
  end
end
