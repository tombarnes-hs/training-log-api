class CreateWorkouts < ActiveRecord::Migration[5.2]
  def change
    create_table :workouts do |t|
      t.date :date
      t.integer :elapsed_time
      t.integer :average_watts
      t.integer :average_hr
      t.integer :pre_fatigue
      t.integer :post_fatigue
      t.string :notes

      t.timestamps
    end
  end
end
