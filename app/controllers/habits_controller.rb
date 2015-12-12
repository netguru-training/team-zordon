class HabitsController < ApplicationController
  before_action :authenticate_user!

  expose(:user_habits) { current_user.habits }

  def index
  end
end