require 'test_helper'

class EventTest < ActiveSupport::TestCase
  def setup
  	@user = users(:one)
  	@event = Event.new(title:"Mockingbird", descript: "robots", date: '20100510', creator_id: @user.id)
  end

  test "is valid" do
  	assert @event.valid?
  end

  test 'title present' do
  	@event.title = "  "
  	assert_not @event.valid?
  end

  test 'date present' do
  	@event.date = "  "
  	assert_not @event.valid?
  end

  test 'past event' do
  	@event_one = events(:one)
  	assert Event.past.include?(@event_one)
  end

  test 'future event' do
  	@event_two = events(:two)
  	assert Event.upcoming.include?(@event_two)
  end
end
