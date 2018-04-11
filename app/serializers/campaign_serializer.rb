class CampaignSerializer < ActiveModel::Serializer
  attributes :id,  :title, :description, :goal, :money_raised, :image_file_url, :user

  def image_file_url
    object.image_file.url()
  end
end
