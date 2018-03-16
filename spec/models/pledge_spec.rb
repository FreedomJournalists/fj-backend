require 'rails_helper'

RSpec.describe Pledge, type: :model do

    user = User.new(
            first_name: "Test first name",
            last_name: "Test last name",
            nickname: "Test nickname",
            email: "Test email"
        )

    owner = User.new(
            first_name: "Owner first name",
            last_name: "Owner last name",
            nickname: "Owner nickname",
            email: "Owner email"
        )

    campaign = Campaign.new(
            title: "Test title",
            description: "Test description",
            money_raised: 0,
            goal: 6000,
            user: owner
        )

    describe "Validations" do
        it "is valid with valid parameters" do
            pledge = Pledge.new(
                money: 5.2,
                message: "Test message",
                date: DateTime.now.utc,
                user: user,
                campaign: campaign
            )
            expect(pledge).to be_valid
        end

        it "is valid without a message" do
            pledge = Pledge.new(
                money: 5.2,
                message: nil,
                date: DateTime.now.utc,
                user: user,
                campaign: campaign
            )
            expect(pledge).to be_valid
        end

        it "is invalid without money" do
            bad_pledge = Pledge.new(
                money: nil,
                message: "Test message",
                date: DateTime.now.utc,
                user: user,
                campaign: campaign
            )
            expect(bad_pledge).to_not be_valid
        end

        it "is invalid without a date" do
            bad_pledge = Pledge.new(
                money: 5.2,
                message: "Test message",
                date: nil,
                user: user,
                campaign: campaign
            )
            expect(bad_pledge).to_not be_valid
        end

        it "is invalid without a user" do
            bad_pledge = Pledge.new(
                money: 5.2,
                message: "Test message",
                date: DateTime.now.utc,
                user: nil,
                campaign: campaign
            )
            expect(bad_pledge).to_not be_valid
        end

        it "is invalid without a campaign" do
            bad_pledge = Pledge.new(
                money: 5.2,
                message: "Test message",
                date: DateTime.now.utc,
                user: user,
                campaign: nil
            )
            expect(bad_pledge).to_not be_valid
        end
    end

    describe "Associations" do
        it "should should belong to campaign" do
            assoc = Pledge.reflect_on_association(:campaign)
            expect(assoc.macro).to eq :belongs_to
        end

        it "should belong to user" do
            assoc = Pledge.reflect_on_association(:user)
            expect(assoc.macro).to eq :belongs_to
        end
    end
end
