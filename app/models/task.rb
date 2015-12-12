class Task < ActiveRecord::Base
  STATES = [:done, :small_done, :suspended, :not_done]
  enum state: STATES

  belongs_to :habit
<<<<<<< HEAD

  scope :on_day, -> (date) { where(created_at: (date.beginning_of_day)..(date.end_of_day)) }

=======
  scope :today, { created_at: (Time.now.beginning_of_day..Time.now.end_of_day) }
>>>>>>> Cron tasks
end
