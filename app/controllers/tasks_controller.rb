class TasksController < ApplicationController
	expose(:task, attributes: :task_params)

	def create
		task.save
		redirect_to habit_history_path, notice: "Your answer has been added"
	end

	private

	def task_params
    params.require(:task).permit(:state)
  end
end