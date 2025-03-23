require "test_helper"

class TimerTest < ActiveSupport::TestCase
  def setup
    @timer = Timer.new(start_time: Time.current)
  end

  test "should be valid with a start_time" do
    assert @timer.valid?
  end

  test "calculate_elapsed_time should return 0 if stop_time is missing" do
    assert_equal 0, @timer.calculate_elapsed_time
  end

  test "calculate_elapsed_time should return elapsed time in seconds" do
    @timer.stop_time = @timer.start_time + 10.minutes
    assert_equal 60000, @timer.calculate_elapsed_time
  end

  test "cleanup should delete old records" do
    old_timer = Timer.create(start_time: 49.hours.ago)
    new_timer = Timer.create(start_time: 47.hours.ago)

    Timer.create(start_time: Time.current)

    assert_not Timer.exists?(old_timer.id)
    assert Timer.exists?(new_timer.id)
  end
end
