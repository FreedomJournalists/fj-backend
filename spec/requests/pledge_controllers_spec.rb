require 'rails_helper'

RSpec.describe "PledgeControllers", type: :request do
    describe "GET /pledge_controllers" do
        context "unauthorized" do
            before {
                get "/pledges"
            }

            it "fails when there is no authentication" do
                expect(response).to_not be_success
            end
        end

        context "authorized" do
            before {
                user = User.new(
                    first_name: "Test first_name",
                    last_name: "Test last_name",
                    nickname: "Test nickname",
                    email: "testmail@mail.test",
                    password: "testpassword"
                )

                user.save

                # Compose token for request
                full_token = "Token token=#{user.token}"

                get "/pledges", headers: { 'Authorization' => full_token }
            }

            it "succeeds when there is authentication" do
                expect(response).to be_success

            end
        end
    end

    # Test creating pledge
    describe "POST /pledge_controllers" do
        context "valid params" do
            before {
                user = User.new(
                    first_name: "Test first_name",
                    last_name: "Test last_name",
                    nickname: "Test nickname",
                    email: "testmail@mail.test",
                    password: "testpassword"
                )
                user.save
                # Compose token for request
                full_token = "Token token=#{user.token}"

                # Create and save campaign
                owner = User.new(
                    first_name: "Owner first_name",
                    last_name: "Owner last_name",
                    nickname: "Owner nickname",
                    email: "ownermail@mail.test",
                    password: "ownerpassword"
                )
                owner.save
                campaign = Campaign.new(
                    title: "Test Title",
                    description: "Test Description",
                    goal: 6000,
                    user: owner
                )
                campaign.save

                valid_params = {
                    money: 2.3,
                    date: DateTime.now.utc,
                    message: "Test message",
                    campaign_id: campaign.id
                }

                post "/pledges", headers: { 'Authorization' => full_token }, params: valid_params
            }

            it "creates and sends a success of creating a pledge" do
                expect(response).to be_success
            end
        end

        context "invalid params" do
            before {
                user = User.new(
                    first_name: "Test first_name",
                    last_name: "Test last_name",
                    nickname: "Test nickname",
                    email: "testmail@mail.test",
                    password: "testpassword"
                )
                user.save
                # Compose token for request
                full_token = "Token token=#{user.token}"

                owner = User.new(
                    first_name: "Owner first_name",
                    last_name: "Owner last_name",
                    nickname: "Owner nickname",
                    email: "ownermail@mail.test",
                    password: "ownerpassword"
                )
                owner.save
                campaign = Campaign.new(
                    title: "Test Title",
                    description: "Test Description",
                    goal: 6000,
                    user: owner
                )
                campaign.save

                invalid_params = {
                    money: 2.3,
                    date: DateTime.now.utc,
                    message: "Test message"
                }

                post "/pledges", headers: { 'Authorization' => full_token }, params: invalid_params
            }

            it "fails to creates a pledge with invalid params and send 400" do
                expect(response).to_not be_success
            end
        end
    end
end
