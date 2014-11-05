require 'test_helper'

class SensorTest < ActiveSupport::TestCase
	def setup
		@user = users(:joe)
		@sensor = @user.sensors.build(name: "motion")
	end

	test "sensor should be valid" do
		assert @sensor.valid?
	end

	test "user id should be present" do
		@sensor.user_id = nil
		assert_not @sensor.valid?
	end

  test "name should be present " do
    @sensor.name = " "
    assert_not @sensor.valid?
  end

  test "name should be at most 40 characters" do
    @sensor.name = "a" * 41
    assert_not @sensor.valid?
  end
end
