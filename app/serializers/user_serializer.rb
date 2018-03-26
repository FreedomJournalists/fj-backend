class UserSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :nickname, :email, :token, :profile_image_file_url

  def profile_image_file_url
    object.profile_image_file.url()
  end
end
