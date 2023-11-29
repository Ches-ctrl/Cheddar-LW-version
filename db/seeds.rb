# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

puts "Deleting previous users, jobs and companies..."

User.destroy_all
Job.destroy_all
Company.destroy_all

puts "Creating new jobs and companies..."

5.times do
  Company.create!(company_name: Faker::Company.name,
                  company_category: Faker::Company.industry)
  puts "Created company - #{Company.last.company_name}"
end

10.times do
  Job.create!(job_title: Faker::Job.title,
              job_description: Faker::Job.field,
              salary: Faker::Number.number(digits: 5),
              company_id: Company.all.sample.id,
              application_deadline: Faker::Date.forward(days: 23))
  puts "Created job - #{Job.last.job_title}"
end

puts "Creating 4 users..."

User.create(email: "email1@gmail.com", password: "password", first_name: "Charlotte", last_name: "the genius", address_first: "Le Wagon", address_second: "London", post_code: "E1 6JJ", city: "London")
puts "Created user:  #{User.first.first_name}"
User.create(email: "email2@gmail.com", password: "password", first_name: "Ilya", last_name: "the russian hacker", address_first: "Le Wagon", address_second: "London", post_code: "E1 6JJ", city: "London")
puts "Created user:  #{User.second.first_name}"
User.create(email: "email3@gmail.com", password: "password", first_name: "Direncan", last_name: "the mysterious", address_first: "Le Wagon", address_second: "London", post_code: "E1 6JJ", city: "London")
puts "Created user:  #{User.third.first_name}"
User.create(email: "email4@gmail.com", password: "password", first_name: "Charlie", last_name: "mr robot", address_first: "Le Wagon", address_second: "London", post_code: "E1 6JJ", city: "London")
puts "Created user:  #{User.fourth.first_name}"

# TODO: Seed applications
# TODO: Connect Users to Applications


puts "Created 4 Super Users"

puts Company.all
puts Job.all
puts User.all

puts "Done!"
