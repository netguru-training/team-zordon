class Habit < ActiveRecord::Base
  serialize :days Array
end
