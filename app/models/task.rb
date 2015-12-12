class Task < ActiveRecord::Base
  STATES = [:done, :small_done, :suspended, :not_done]
  enum state: STATES

  belongs_to :habit

  scope :on_day, -> (date) { where(created_at: (date.beginning_of_day)..(date.end_of_day)) }

end
