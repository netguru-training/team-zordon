class Habit < ActiveRecord::Base
  has_merit
  serialize :days, Array
  
  has_many :tasks, dependent: :destroy
  has_many :achievements, as: :achievementable
  belongs_to :user

  accepts_nested_attributes_for :tasks
end
