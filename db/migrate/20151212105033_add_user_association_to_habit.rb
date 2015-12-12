class AddUserAssociationToHabit < ActiveRecord::Migration
  def change
    add_reference :habits, :user, index: true
  end
end
