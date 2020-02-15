users = [
user1 = User.create(email: 'test-user1@event.com', password: 'password'),
user2 = User.create(email: 'test-user2@event.com', password: 'password'),
user3 = User.create(email: 'test-user3@event.com', password: 'password')
]


users.each do |user|
  2.times do
    Event.create(
    name: Faker::Music.album,
    location: Faker::Address.city,
    notes: Faker::GreekPhilosophers.quote,
    user_id: user1.id
    )
  end 
  2.times do
    Event.create(
    name: Faker::Music.album,
    location: Faker::Address.city,
    notes: Faker::GreekPhilosophers.quote,
    user_id: user2.id
    )
  end 
  2.times do
    Event.create(
    name: Faker::Music.album,
    location: Faker::Address.city,
    notes: Faker::GreekPhilosophers.quote,
    user_id: user3.id
    )
  end 
end 