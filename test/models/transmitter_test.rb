require 'test_helper'

class TransmitterTest < ActiveSupport::TestCase
  def setup
    @user = users(:dan)
    @transmitter = @user.transmitters.build(name: "LifeSense", user_id: @user.id)
  end

  test "transmitter should be valid" do
    assert @transmitter.valid?
  end

  test "user id should be present" do
    @transmitter.user_id = nil
    assert_not @transmitter.valid?
  end

  test "name should be present " do
    @transmitter.name = " "
    assert_not @transmitter.valid?
  end

  test "name should be at most 80 characters" do
    @transmitter.name = "a" * 81
    assert_not @transmitter.valid?
  end
end
