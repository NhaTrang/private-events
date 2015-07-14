require 'test_helper'

class InviteTest < ActiveSupport::TestCase
  def setup
  	@invite = Invite.new(attendee_id: 1, attended_event_id: 1)
  end

  test 'valid' do
  	assert @invite.valid?
  end

  test 'attendee_id presence' do
  	@invite.attendee_id = " "
  	assert_not @invite.valid?
  end

  test 'attended_event_id presence' do
  	@invite.attended_event_id = " "
  	assert_not @invite.valid?
  end

  test 'unique attended_event_id/attendee_id' do
  	@invite2 = @invite
  	@invite.save
  	assert_no_difference 'Invite.count' do
  		@invite2.save
  	end
  end
end
