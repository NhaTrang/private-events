require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase
  test "get index" do
     get :index
     assert_response :success
  end
end
