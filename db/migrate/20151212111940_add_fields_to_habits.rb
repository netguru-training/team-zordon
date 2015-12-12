class AddFieldsToHabits < ActiveRecord::Migration
  def change
    add_column :habits, :sash_id, :integer
    add_column :habits, :level,   :integer, :default => 0
  end
end
