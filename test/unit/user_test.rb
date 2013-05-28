require 'test_helper'

class UserTest < ActiveSupport::TestCase
	# fixtures :users

	test "user is saved successfully" do	
		@user_unitTest = User.new :email => 'user1@test.com',
		:password  => '1234567',
		:password_confirmation  => '1234567'
		assert @user_unitTest.save
	end

	test "user is copied successfully" do
		@user_unitTest = User.new :email => 'user2@test.com',
		:password  => '1234567',
		:password_confirmation  => '1234567'
		assert @user_unitTest.save
		user_unitTest_copia = User.find(@user_unitTest.id)
		assert_equal @user_unitTest, user_unitTest_copia
	end

	test "user is updated successfully" do
		@user_unitTest = User.new :email => 'user3@test.com',
		:password  => '1234567',
		:password_confirmation  => '1234567'
		assert @user_unitTest.save
		first_password_hash = User.find_by_email('user3@test.com').password_hash
		@user_unitTest.password = '7654321'
		@user_unitTest.password_confirmation = '7654321'
		assert @user_unitTest.save
		assert_not_equal User.find_by_email('user3@test.com').password_hash, first_password_hash
	end

	test "used is deleted successfully" do
		@user_unitTest = User.new :email => 'user4@test.com',
		:password  => '1234567',
		:password_confirmation  => '1234567'
		assert @user_unitTest.save
		assert User.find(@user_unitTest.id).destroy
		assert_equal User.find_by_email('user4@test.com'), nil
	end
end