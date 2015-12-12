# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
user = CreateAdminService.new.call
puts 'CREATED ADMIN USER: ' << user.email
# Environment variables (ENV['...']) can be set in the file .env file.
#

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
