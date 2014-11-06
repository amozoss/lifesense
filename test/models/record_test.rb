require 'test_helper'

class RecordTest < ActiveSupport::TestCase
	def setup
		@user = users(:joe)
		@sensor = @user.sensors.build(name: "motion")
    @record = @sensor.records.build(time_stamp: DateTime.now.to_i * 1000, value: 10.2)
	end

	test "sensor id should be present" do
		@record.sensor_id = nil
		assert_not @record.valid?
	end

  test "time_stamp should be present " do
    @record.time_stamp = " "
    assert_not @record.valid?
  end

  test "value should be present " do
    @record.value = " "
    assert_not @record.valid?
  end
end
