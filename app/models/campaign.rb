class Campaign < ApplicationRecord
    belongs_to :user
    has_many :pledges
    has_many :supporters, through: :pledges, class_name: "User"

    validates :title, presence: true
    validates :description, presence: true
    validates :goal, presence: true
end
