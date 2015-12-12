class AchievementsController < ApplicationController
  expose(:achievements) { current_user.achievements }
end
