class CreateHighScores < ActiveRecord::Migration[8.0]
  def change
    create_table :high_scores do |t|
      t.string :name
      t.integer :time

      t.timestamps
    end
  end
end
