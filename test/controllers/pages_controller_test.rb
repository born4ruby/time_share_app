require 'test_helper'

class PagesControllerTest < ActionController::TestCase
  test "should get request_reservation" do
    get :request_reservation
    assert_response :success
  end

end
