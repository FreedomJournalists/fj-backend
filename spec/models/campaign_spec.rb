require 'rails_helper'

RSpec.describe Campaign, type: :model do

    user = User.new(
            first_name: "Test first name",
            last_name: "Test last name",
            nickname: "Test nickname",
            email: "Test email"
        )

    describe "Validations" do
        it "is valid with valid parameters" do
            campaign = Campaign.new(
                title: "Test title",
                description: "Test description",
                money_raised: 0,
                goal: 6000,
                user: user
            )
            expect(campaign).to be_valid
        end

        it "is invalid without a title" do
            bad_campaign = Campaign.new(
                title: nil,
                description: "Test description",
                money_raised: 00,
                goal: 6000,
                user: user
            )
            expect(bad_campaign).to_not be_valid
        end

        it "is invalid without a description" do
            bad_campaign = Campaign.new(
                title: "Test title",
                description: nil,
                money_raised: 0,
                goal: 6000,
                user: user
            )
            expect(bad_campaign).to_not be_valid
        end

        it "is valid without money_raised" do
            campaign = Campaign.new(
                title: "Test title",
                description: "Test description",
                money_raised: nil,
                goal: 6000,
                user: user
            )
            expect(campaign).to be_valid
        end

        it "is invalid without a goal" do
            bad_campaign = Campaign.new(
                title: "Test title",
                description: "Test description",
                money_raised: 0,
                goal: nil,
                user: user
            )
            expect(bad_campaign).to_not be_valid
        end

        it "is invalid without a user" do
            bad_campaign = Campaign.new(
                title: "Test title",
                description: "Test description",
                money_raised: 0,
                goal: 6000,
                user: nil
            )
            expect(bad_campaign).to_not be_valid
        end
    end
end
