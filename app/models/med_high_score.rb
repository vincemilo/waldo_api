class MedHighScore < ApplicationRecord
  validates :name, presence: true
  validates :time, presence: true
  before_create :cleanup

  def cleanup
    # remove all records lower than the top ten
    top_ten_ids = MedHighScore.order(:time).limit(9).pluck(:id)
    MedHighScore.where.not(id: top_ten_ids).delete_all
  end
end
