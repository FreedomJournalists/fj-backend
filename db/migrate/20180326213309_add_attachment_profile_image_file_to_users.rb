class AddAttachmentProfileImageFileToUsers < ActiveRecord::Migration[5.1]
  def self.up
    change_table :users do |t|
      t.attachment :profile_image_file
    end
  end

  def self.down
    remove_attachment :users, :profile_image_file
  end
end
