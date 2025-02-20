class HighScore < ApplicationRecord
  before_create :cleanup

  def cleanup
    # remove all records lower than the top ten
    top_ten_ids = HighScore.order(:time).limit(9).pluck(:id)
    HighScore.where.not(id: top_ten_ids).delete_all
  end
end
