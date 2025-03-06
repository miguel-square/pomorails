class CreatePomodoros < ActiveRecord::Migration[8.0]
  def change
    create_table :pomodoros do |t|
      t.references :user, null: false, foreign_key: true
      t.datetime :start_time
      t.datetime :end_time
      t.boolean :completed
      t.text :notes
      t.integer :duration_minutes

      t.timestamps
    end
  end
end
