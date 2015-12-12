class Achievement < ActiveRecord::Base
  belongs_to :achievementable, polymorphic: true
end
