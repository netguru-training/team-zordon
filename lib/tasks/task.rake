desc "Cron tasks"
task cron_tasks: :environment do
  status_where_missing
end

private

def status_where_missing
  Habit.all.each do |habit|
    state = condition(habit) ? :not_done : :suspended
    @task = Task.new(state: state)
    @task.created_at = Date.today-1
    @task.save
    habit.tasks << @task
  end
end

def condition(habit)
  habit.tasks.on_day(Date.today-1) && habit.active?
end
