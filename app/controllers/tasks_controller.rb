class TasksController < ApplicationController
	expose(:task, attributes: :task_params)
	expose(:habit)

	def create
		habit.tasks.save
		redirect_to habit_history_path, notice: "Your answer has been added"
	end

	private

	def task_params
    params.require(:task).permit(:state)
  end
end