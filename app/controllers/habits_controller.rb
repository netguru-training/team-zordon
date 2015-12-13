# controller for habits
class HabitsController < ApplicationController
  before_action :authenticate_user!

  expose(:user_habits) { current_user.habits.includes(:tasks) }
  expose_decorated(:habit, attributes: :habit_params)

  def create
    habit.days = params[:days].map{ |day| day.to_i }
    habit.user = current_user
    if habit.save
      redirect_to habit_path(habit),
        notice: I18n.t('shared.created', resource: 'Habit')
    else
      render :new
    end
  end

  def update
    habit.days = params[:days].map{ |day| day.to_i }
    habit.user = current_user
    if habit.save
      redirect_to habit_path(habit),
        notice: I18n.t('shared.created', resource: 'Habit')
    else
      render :new
    end

  end

  def edit
  end

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
