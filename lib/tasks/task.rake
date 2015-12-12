desc "Cron tasks"
task cron_tasks: :environment do
  status_where_missing
end

private

def status_where_missing
  Habit.all.each do |habit|
    state = condition(habit) ? :not_done : :suspended
    habit.tasks << Task.create(state: state)
  end
end

def condition(habit)
  habit.tasks.today && habit.active?
end
