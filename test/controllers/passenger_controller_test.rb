require "test_helper"

class PassengerControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get passenger_new_url
    assert_response :success
  end

  test "should get create" do
    get passenger_create_url
    assert_response :success
  end
end
