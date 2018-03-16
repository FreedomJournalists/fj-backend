class Pledge < ApplicationRecord
    belongs_to :user
    belongs_to :campaign

    validates :money, :date, presence: true
end
