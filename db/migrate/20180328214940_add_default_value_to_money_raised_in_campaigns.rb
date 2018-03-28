class AddDefaultValueToMoneyRaisedInCampaigns < ActiveRecord::Migration[5.1]
  def change
     change_column_default :campaigns, :money_raised, 0
  end
end
