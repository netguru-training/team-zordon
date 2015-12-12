class Task < ActiveRecord::Base
  STATES = [:done, :small_done, :suspended, :not_done]
  enum state: STATES

  validates :state, inclusion: { in: STATES }, presence: true
end
