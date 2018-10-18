class AddUserToWorkouts < ActiveRecord::Migration[5.2]
  def change
    add_reference :workouts, :user, foreign_key: true
  end
end
