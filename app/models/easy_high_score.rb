class EasyHighScore < ApplicationRecord
  validates :name, presence: true
  validates :time, presence: true
  before_create :cleanup

  def cleanup
    # remove all records lower than the top ten
    top_ten_ids = EasyHighScore.order(:time).limit(9).pluck(:id)
    EasyHighScore.where.not(id: top_ten_ids).delete_all
  end
end
