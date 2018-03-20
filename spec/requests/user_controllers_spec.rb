require 'rails_helper'

RSpec.describe "UserControllers", type: :request do
    describe "GET /user_controllers" do
        context "unauthorized" do
            before {
                get "/users"
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

                get "/users", headers: { 'Authorization' => full_token }
            }

            it "succeeds when there is authentication" do
                expect(response).to be_success

            end
        end
    end

    # Test signing up a users
    describe "POST /user_controllers" do
        context "valid params" do
            before {
                valid_params = {
                    first_name: "Test first_name",
                    last_name: "Test last_name",
                    nickname: "Test nickname",
                    email: "testmail@mail.test",
                    password: "testpassword"
                }
                post "/users", params: valid_params
            }

            it "creates and sends a success of creating a user with valid password" do
                expect(response).to be_success
            end
        end

        context "invalid params" do
            before {
                invalid_params = {
                    first_name: "Test first_name",
                    last_name: "Test last_name",
                    email: "testmail@mail.test",
                    password: "testpassword"
                }
                post "/users", params: invalid_params
            }

            it "should fails and send 400" do
                expect(response).to_not be_success
            end
        end
    end
end
