class Habit < ActiveRecord::Base
  serialize :days, Array
  has_many :achievements, as: :achievementable
end
