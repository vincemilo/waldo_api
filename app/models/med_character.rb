class MedCharacter < ApplicationRecord
  validates :name, presence: true
  validates :x_ratio, presence: true
  validates :y_ratio, presence: true
end
