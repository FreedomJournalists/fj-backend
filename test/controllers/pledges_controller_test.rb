require 'test_helper'

class PledgesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @pledge = pledges(:one)
  end

  test "should get index" do
    get pledges_url, as: :json
    assert_response :success
  end

  test "should create pledge" do
    assert_difference('Pledge.count') do
      post pledges_url, params: { pledge: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show pledge" do
    get pledge_url(@pledge), as: :json
    assert_response :success
  end

  test "should update pledge" do
    patch pledge_url(@pledge), params: { pledge: {  } }, as: :json
    assert_response 200
  end

  test "should destroy pledge" do
    assert_difference('Pledge.count', -1) do
      delete pledge_url(@pledge), as: :json
    end

    assert_response 204
  end
end
