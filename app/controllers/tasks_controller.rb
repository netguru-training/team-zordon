class TasksController < ApplicationController
	expose(:task, attributes: :task_params)
	expose(:habit)

	def create
    task.save
		habit.tasks << task

    head status: 200
	end

	def update 
    task.save

    head status: 200
	end

	private

	def task_params
    params.require(:task).permit(:state)
  end
end
