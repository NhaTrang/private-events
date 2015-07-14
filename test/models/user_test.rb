require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
  	@user = User.new(name: "Bob", email: "chicken@yahoo.com", user: "Badman")
  	@user_one = users(:one)
  	@event_one = events(:one)
  	@event_two = events(:two)
  end

  test 'should be valid' do
  	@user.valid?
  end

  test 'email present' do
  	@user.email = "   "
  	assert_not @user.valid?
  end

  test 'name present' do
  	@user.name = " "
  	assert_not @user.valid?
  end

  test 'user present' do
  	@user.user = " "
  	assert_not @user.valid?
  end

  test 'unique email' do
  	@user2 = @user
  	@user.save
  	assert_no_difference 'User.count' do
  		@user2.save
  	end
  end

  test 'valid email' do
  	@user.email = "isthisthebathroom"
  	assert_not @user.valid?
  end

  test 'not attending event' do
  	assert_not @user_one.attending?(@event_one)
  end

  test 'attending event' do
  	Invite.create(attendee_id: @user_one.id, attended_event_id: @event_one.id)
  	assert @user_one.attending?(@event_one)
  end

  test 'past event check' do
  	Invite.create(attendee_id: @user_one.id, attended_event_id: @event_one.id)
  	assert @user_one.previous_events.include?(@event_one)
  end

  test 'future event check' do
  	Invite.create(attendee_id: @user_one.id, attended_event_id: @event_two.id)
  	assert @user_one.attending?(@event_two)
  	assert @user_one.upcoming_events.include?(@event_two)
  end
end
