require 'rails_helper'

RSpec.describe Pledge, type: :model do
    describe "Validations" do
        it "is valid with valid parameters" do
            pledge = Pledge.new(
                money: 5.2,
                message: "Test message",
                date: DateTime.now.utc
            )
            expect(pledge).to be_valid
        end

        it "is valid without a message" do
            pledge = Pledge.new(
                money: 5.2,
                message: nil,
                date: DateTime.now.utc
            )
            expect(campaign).to be_valid
        end

        it "is invalid without money" do
            pledge = Pledge.new(
                money: nil,
                message: "Test message",
                date: DateTime.now.utc
            )
            expect(campaign).to be_valid
        end

        it "is invalid without a date" do
            pledge = Pledge.new(
                money: 5.2,
                message: "Test message",
                date: nil
            )
            expect(campaign).to be_valid
        end
    end
end
