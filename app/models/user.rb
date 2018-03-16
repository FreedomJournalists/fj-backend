class User < ApplicationRecord
    has_many :campaigns
    has_many :pledges
    has_many :causes, through: :pledges, class_name: "Campaign"

    validates :first_name, :last_name, presence: true
    validates :nickname, :email, presence: true, uniqueness: true
end
