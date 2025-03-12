class CreateEasyHighScores < ActiveRecord::Migration[8.0]
  def change
    create_table :easy_high_scores do |t|
      t.string :name
      t.integer :time

      t.timestamps
    end
  end
end
