class Timer < ApplicationRecord
  before_create :cleanup

  def calculate_elapsed_time
    if stop_time && start_time
      (stop_time - start_time) * 100 # Convert to seconds
    else
      0
    end
  end

  def cleanup
    Timer.where("start_time <?", 48.hours.ago).delete_all
  end
end
