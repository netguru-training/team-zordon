puts "Seeds: start"
user = CreateAdminService.new.call
puts 'CREATED ADMIN USER: ' << user.email
user = User.create!(email: 'admin@admin4.com', password: 'adminadmin')

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

Achievement.create!(
  name: "Spiderman",
  description: "Congrats! You have stayed with your habit for one week",
  image: "spiderman.jpg",
  )
Achievement.create!(
  name: "Batman",
  description: "Congrats! You have stayed with your habit for two weeks",
  image: "batman.jpg",
  )
Achievement.create!(
  name: "Hulk",
  description: "Congrats! You have stayed with your habit for one month",
  image: "hulk.jpg",
  )
Achievement.create!(
  name: "Superman",
  description: "Congrats! You have stayed with your habit for three months",
  image: "superman.jpg",
  )
Achievement.create!(
  name: "Ironman",
  description: "Congrats! You have stayed with your habit for half a year",
  image: "ironman.jpg",
  )




puts "CREATED ACHIEVEMENTS"

puts "Seeds: done"

