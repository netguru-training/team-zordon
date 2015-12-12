# Migration changing state type for puruses of enum
class ChangeTaskStateColumnType < ActiveRecord::Migration
  def up
    remove_column :tasks, :state
    add_column :tasks, :state, :integer
  end

  def down
    remove_column :tasks, :state
    add_column :tasks, :state, :strings
  end
end
