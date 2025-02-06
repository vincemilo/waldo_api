class CreateTimers < ActiveRecord::Migration[8.0]
  def change
    create_table :timers do |t|
      t.datetime :start_time
      t.datetime :stop_time
      t.integer :elapsed_time

      t.timestamps
    end
  end
end
