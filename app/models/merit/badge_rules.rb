# Be sure to restart your server when you modify this file.
#
# +grant_on+ accepts:
# * Nothing (always grants)
# * A block which evaluates to boolean (recieves the object as parameter)
# * A block with a hash composed of methods to run on the target object with
#   expected values (+votes: 5+ for instance).
#
# +grant_on+ can have a +:to+ method name, which called over the target object
# should retrieve the object to badge (could be +:user+, +:self+, +:follower+,
# etc). If it's not defined merit will apply the badge to the user who
# triggered the action (:action_user by default). If it's :itself, it badges
# the created object (new user for instance).
#
# The :temporary option indicates that if the condition doesn't hold but the
# badge is granted, then it's removed. It's false by default (badges are kept
# forever).

module Merit
  class BadgeRules
    include Merit::BadgeRulesMethods

    def initialize
      # If it creates user, grant badge
      # Should be "current_user" after registration for badge to be granted.
      # Find badge by badge_id, badge_id takes presidence over badge
      # grant_on 'users#create', badge_id: 7, badge: 'just-registered', to: :itself

      # If it has 10 comments, grant commenter-10 badge
      # grant_on 'comments#create', badge: 'commenter', level: 10 do |comment|
      #   comment.user.comments.count == 10
      # end

      # If it has 5 votes, grant relevant-commenter badge
      # grant_on 'comments#vote', badge: 'relevant-commenter',
      #   to: :user do |comment|
      #
      #   comment.votes.count == 5
      # end

      # Changes his name by one wider than 4 chars (arbitrary ruby code case)
      # grant_on 'registrations#update', badge: 'autobiographer',
      #   temporary: true, model_name: 'User' do |user|
      #
      #   user.name.length > 4
      # end

grant_on 'tasks#create', badge: 'One week strak', 
  model_name: 'task', to: :habit do |task|
    streak_check(1.week.ago, task)
end

grant_on 'tasks#create', badge: 'Two week strak', 
  model_name: 'task', to: :habit do |task|
    streak_check(2.weeks.ago, task)
end

grant_on 'tasks#create', badge: 'Three week strak', 
  model_name: 'task', to: :habit do |task|
    streak_check(3.weeks.ago, task)
end

Merit::Badge.create!(
  id: 4,
  name: "Good Start",
  description: "For the first done task"
  )
# Badge for the first habit done task
grant_on 'tasks#create', badge: 'Even the longes jurney...', 
  model_name: 'task', to: :habit do |task|
    task.habit.tasks.count == 1
end

Merit::Badge.create!(
  id: 5,
  name: "Dexter",
  description: "Make three tasks green in one day"
  )

# Make three tasks green in one day
grant_on 'tasks#create', badge: 'Dexter', 
  model_name: 'task', to: :user do |task|
    user = task.habit.user 
    user.tasks.done.on_day(1.day.ago).count == 3
end

Merit::Badge.create!(
  id: 6,
  name: "Rambo part 10",
  description: "Make a task green after 4 fails in a row"
  )

grant_on 'tasks#create', badge: 'Dexter', 
  model_name: 'task', to: :habit do |task|
    last_tasks = task.habit.tasks.last(5)
    last_tasks.last.done? && last_tasks.first(4).all?(&:not_done?)
end

Merit::Badge.create!(
  id: 7,
  name: "Alibaba",
  description: "Make 40 tasks green"
  )

grant_on 'tasks#create', badge: 'Alibaba', 
  model_name: 'task', to: :user do |task|
    user = task.habit.user
    user.
end

Merit::Badge.create!(
  id: 8,
  name: "Path to glory",
  description: "Create account"
  )

Merit::Badge.create!(
  id: 9,
  name: "Bad day",
  description: "Fail 3 tasks in one day"
  )

Merit::Badge.create!(
  id: 10,
  name: "Holidays",
  description: "Suspend task for a week"
  )

Merit::Badge.create!(
  id: 11,
  name: "Tomorow will be better",
  description: "Mark small done taks"
  )

Merit::Badge.create!(
  id: 12,
  name: "Rising Sun",
  description: "Make a small done task after a fail"
  )

Merit::Badge.create!(
  id: 13,
  name: "Hammer of wrath",
  description: "Make a three task green in one day after more then two days of fail tasks"
  )

Merit::Badge.create!(
  id: 14,
  name: "Nobody expects the Spanish Inquisition",
  description: "Fail one task after more then 30 days of a green streak"
  )

Merit::Badge.create!(
  id: 15,
  name: "Superman",
  description: "Make 3 green taska everyday for a week"
  )

Merit::Badge.create!(
  id: 16,
  name: "Herkules",
  description: "Make 2 green tasks everyday for a week"
  )

Merit::Badge.create!(
  id: 17,
  name: "Macgyver",
  description: "Make tasks green in one day"
  )

Merit::Badge.create!(
  id: 18,
  name: "Back to work",
  description: "Make green task right after suspended task"
  )

Merit::Badge.create!(
  id: 19,
  name: "Flash",
  description: "Make 100 green tasks in 40 days"
  )

Merit::Badge.create!(
  id: 20,
  name: "Chuck Norris",
  description: "Make 90 green tasks in 30 days"
  )
    end
  end

private
  def streak_check(date, task)
    yesterday = 1.day.ago
    between = (yesterday.beginning_of_day + date)..yesterday.end_of_day
    task.habit.tasks.done.where(created_at: between).all?(&:done?)
  end
end
