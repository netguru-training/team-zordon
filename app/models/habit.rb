class Habit < ActiveRecord::Base
  has_merit

  serialize :days, Array
  has_many :achievements, as: :achievementable
end
