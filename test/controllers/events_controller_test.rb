require 'test_helper'

class EventsControllerTest < ActionController::TestCase
  def setup
    @event = events(:one)
    @user = users(:one)
  end

  test "should redirect create when not logged in" do
    assert_no_difference "Event.count" do
      post :create, event: {title: "cat", date: 19500510}
    end
    assert_redirected_to root_path
  end
  	
  test "should redirect new when not logged in" do
    get :new
    assert_redirected_to root_path
  end

  test 'should get index' do
  	get :index
  	assert_response :success
  end

  test 'should redirect to events path after post and logged in' do
    log_in_as(@user)
    assert_difference "Event.count", 1 do
      post :create, event: {title: "cat", date: '1950-05-10', descript: "momo", location: "bathroom"}
    end
    assert_redirected_to events_path
  end

end
