require 'rails_helper'

RSpec.describe "CampaignControllers", type: :request do
    describe "GET /campaign_controllers" do
        context "unauthorized" do
            before {
                get "/campaigns"
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

                get "/campaigns", headers: { 'Authorization' => full_token }
            }

            it "succeeds when there is authentication" do
                expect(response).to be_success

            end
        end
    end

    # Test creating campaign
    describe "POST /campaign_controllers" do
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

                valid_params = {
                    title: "Test Title",
                    description: "Test Description",
                    goal: 6000
                }

                post "/campaigns", headers: { 'Authorization' => full_token }, params: valid_params
            }

            it "creates and sends a success of creating a campaign" do
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

                invalid_params = {
                    title: "Title",
                    description: "Description"
                }

                post "/campaigns", headers: { 'Authorization' => full_token }, params: invalid_params
            }

            it "fails to creates a campaign with invalid params and send 400" do
                expect(response).to_not be_success
            end
        end
    end
end
