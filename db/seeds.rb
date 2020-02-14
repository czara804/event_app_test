

5.times do
  Event.create(
  name: Faker::Music.album,
  location: Faker::Address.city,
  notes: Faker::GreekPhilosophers.quote
)

end
