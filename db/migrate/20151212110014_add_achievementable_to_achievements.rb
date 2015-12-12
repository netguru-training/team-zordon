class AddAchievementableToAchievements < ActiveRecord::Migration
  def change
    add_column :achievements, :achievementable_id, :integer
    add_column :achievements, :achievementable_type, :string
  end
end
