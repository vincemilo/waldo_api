class CreateCharacters < ActiveRecord::Migration[8.0]
  def change
    create_table :characters do |t|
      t.string :name
      t.decimal :x_ratio
      t.decimal :y_ratio

      t.timestamps
    end
  end
end
