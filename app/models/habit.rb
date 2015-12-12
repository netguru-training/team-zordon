class Habit < ActiveRecord::Base
  serialize :days, Array
  has_many :achievement, as: :achievementable
end
