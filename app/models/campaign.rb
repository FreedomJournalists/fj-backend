class Campaign < ApplicationRecord
    belongs_to :user
    has_many :pledges
    has_many :supporters, through: :pledges, class_name: "User"

    has_attached_file :image_file, :styles => {
    :original => "400x200#" },
    :convert_options => {
    :thumb => "-quality 75 -strip"}

    validates :title, :description, :goal, presence: true
    validates_attachment_content_type :image_file, content_type: /\Aimage/
end
