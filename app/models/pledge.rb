class Pledge < ApplicationRecord
    belongs_to :user
    belongs_to :campaign

    validates :money, presence: true
    validates :date, presence: true
end
