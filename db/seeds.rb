# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
User.create!(
  name: "admin",
  email: "admin@example.com",
  password: "P@ssw0rd",
  password_confirmation: "P@ssw0rd",
  role: "admin"
)
10.times do |n|
  User.create!(
    name: "test#{n + 1}",
    email: "test#{n + 1}@example.com",
    password: "P@ssw0rd",
    password_confirmation: "P@ssw0rd"
  )
end

Prompt.create!(
  bad_prompt: "Landscape at the underwater, deep darkness, no light, nothing, realistic",
  good_prompt: "beautiful blue sky, looking up from the water, only sky, photo realistic",
  question: "深い水の底"
)

