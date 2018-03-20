require 'rails_helper'

RSpec.describe User, type: :model do
    describe "Validations" do
        it "is valid with valid parameters" do
            user = User.new(
                first_name: "Test first name",
                last_name: "Test last name",
                nickname: "Test nickname",
                email: "Test email",
                password: "Test password"
            )
            expect(user).to be_valid
        end

        it "is invalid without a first_name" do
            bad_user = User.new(
                first_name: nil,
                last_name: "Test last name",
                nickname: "Test nickname",
                email: "Test email",
                password: "Test password"
            )
            expect(bad_user).to_not be_valid
        end

        it "is invalid without a last_name" do
            bad_user = User.new(
                first_name: "Test first name",
                last_name: nil,
                nickname: "Test nickname",
                email: "Test email",
                password: "Test password"
            )
            expect(bad_user).to_not be_valid
        end

        it "is invalid without a nickname" do
            bad_user = User.new(
                first_name: "Test first name",
                last_name: "Test last name",
                nickname: nil,
                email: "Test email",
                password: "Test password"
            )
            expect(bad_user).to_not be_valid
        end

        it "is invalid without an email" do
            bad_user = User.new(
                first_name: "Test first name",
                last_name: "Test last name",
                nickname: "Test nickname",
                email: nil,
                password: "Test password"
            )
            expect(bad_user).to_not be_valid
        end

        it "is invalid without a password" do
            bad_user = User.new(
                first_name: "Test first name",
                last_name: "Test last name",
                nickname: "Test nickname",
                email: "Test email",
                password: nil
            )
            expect(bad_user).to_not be_valid
        end
    end

    describe "Associations" do
        it "should have many campaigns" do
            assoc = User.reflect_on_association(:campaigns)
            expect(assoc.macro).to eq :has_many
        end

        it "should have many pledges" do
            assoc = User.reflect_on_association(:pledges)
            expect(assoc.macro).to eq :has_many
        end
    end
end
