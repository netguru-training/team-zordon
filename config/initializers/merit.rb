# Use this hook to configure merit parameters
Merit.setup do |config|
  # Check rules on each request or in background
  # config.checks_on_each_request = true

  # Define ORM. Could be :active_record (default) and :mongoid
  # config.orm = :active_record

  # Add application observers to get notifications when reputation changes.
  # config.add_observer 'MyObserverClassName'

  # Define :user_model_name. This model will be used to grand badge if no
  # `:to` option is given. Default is 'User'.
  # config.user_model_name = 'User'

  # Define :current_user_method. Similar to previous option. It will be used
  # to retrieve :user_model_name object if no `:to` option is given. Default
  # is "current_#{user_model_name.downcase}".
  # config.current_user_method = 'current_user'
end

# Create application badges (uses https://github.com/norman/ambry)
# badge_id = 0
# [{
#   id: (badge_id = badge_id+1),
#   name: 'just-registered'
# }, {
#   id: (badge_id = badge_id+1),
#   name: 'best-unicorn',
#   custom_fields: { category: 'fantasy' }
# }].each do |attrs|
#   Merit::Badge.create! attrs
# end
Merit::Badge.create!(
  id: 1,
  name: "One week strak",
  description: "Habit week long"
  )

Merit::Badge.create!(
  id: 2,
  name: "Two week strak",
  description: "Habit two week long"
  )

Merit::Badge.create!(
  id: 3,
  name: "Three week streak",
  description: "Habit three week long"
  )

Merit::Badge.create!(
  id: 4,
  name: "Good Start",
  description: "For the first done task"
  )

Merit::Badge.create!(
  id: 5,
  name: "Dexter",
  description: "Make three tasks green in one day"
  )

Merit::Badge.create!(
  id: 6,
  name: "Rambo part 10",
  description: "Make a task green after 4 fails in a row"
  )

Merit::Badge.create!(
  id: 7,
  name: "Alibaba",
  description: "Make 40 tasks green"
  )

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


