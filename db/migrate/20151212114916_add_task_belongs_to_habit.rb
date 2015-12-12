class AddTaskBelongsToHabit < ActiveRecord::Migration
  def change
    add_column :tasks, :habit_id, :integer
    add_index :tasks, :habit_id
  end
end
