class HabitsController < ApplicationController
  before_action :authenticate_user!

  expose(:user_habits) { current_user.habits.includes(:tasks) }

  def index
  end

  def history
  end
end
