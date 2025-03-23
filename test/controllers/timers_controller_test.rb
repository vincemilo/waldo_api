require "test_helper"

class TimersControllerTest < ActionDispatch::IntegrationTest
  setup do
    Timer.delete_all
  end

  test "should create timer with valid data" do
    assert_difference("Timer.count", 1) do
      post timers_url, as: :json
    end
    assert_response :created
    assert_not_nil JSON.parse(response.body)["id"]
  end

  test "should update timer with stop_time and elapsed_time" do
    timer = Timer.create(start_time: Time.current)
    patch timer_url(timer), as: :json
    assert_response :ok
    assert_not_nil JSON.parse(response.body)["elapsed_time"]
  end
end
