puts "Seeds: start"
user = CreateAdminService.new.call
puts 'CREATED ADMIN USER: ' << user.email
user = User.create(email: 'admin@admin.com', password: 'adminadmin')

3.times do
  has_small = rand(1..2) == 1

  Habit.create!(
    user: user,
    name: Faker::Lorem.sentence(4),
    description: Faker::Lorem.paragraph,
    days: [rand(0..6), rand(0..6)].sort.uniq,
    small_name: (has_small ? Faker::Lorem.sentence(3) : nil),
    small_description: (has_small ? Faker::Lorem.paragraph : nil)
  )
end
puts "CREATED HABITS"

Habit.all.each do |habit|
  (0..10).each do |index|
    habit.tasks << Task.create(state: rand(0..3), created_at: DateTime.current - index.days, habit: habit)
  end
end
puts "CREATED TASKS"


ACHIEVEMENT_NAMES = %w(Batman Superman Tarzan Hulk).shuffle
SEEN_STATE = %w(true false)

5.times do
	Achievement.create!(
	  name: ACHIEVEMENT_NAMES.pop,
	  description: Faker::Lorem.sentence,
	  image: Faker::Avatar.image("50x50"),
	  seen: SEEN_STATE.sample 
		)
end
puts "CREATED ACHIEVEMENTS"

puts "Seeds: done"

