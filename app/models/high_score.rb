class HighScore < ApplicationRecord
  before_create :cleanup

  def cleanup
    HighScore.order(:time)
  end
end
