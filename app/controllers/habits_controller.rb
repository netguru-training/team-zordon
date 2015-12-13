# controller for habits
class HabitsController < ApplicationController
  before_action :authenticate_user!

  expose(:user_habits) { current_user.habits.includes(:tasks) }
  expose(:habit, attributes: :habit_params)


  def index
  end

  def history
  end

  private

  def habit_params
    params.require(:habit).permit(:name, :descriptino,
      :small_name, :small_description, :active)
  end
end
