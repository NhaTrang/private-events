require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
  	@user = User.new(name: "Bob", email: "chicken@yahoo.com", user: "Badman")
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
end
