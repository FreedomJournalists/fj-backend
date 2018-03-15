class Pledge < ApplicationRecord
    belongs_to :user, :campaign
end
