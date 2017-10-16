u = User.new(username: "Test", email: "test@test.com", password: "test@test.com", password_confirmation: "test@test.com")
u.save

1000.times do
  Entry.create(user_id: 1, title: Faker::Lorem.word, body: Faker::Lorem.paragraph)
end
