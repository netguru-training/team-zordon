class Task < ActiveRecord::Base
  STATES = [:done, :small_done, :suspended, :not_done]
  enum state: STATES

  belongs_to :habit

end
