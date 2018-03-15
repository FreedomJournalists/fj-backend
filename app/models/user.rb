class User < ApplicationRecord
    has_many :campaigns, :pledges
    has_many :causes, through: :pledges, class_name: "Campaign"
end
