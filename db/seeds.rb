# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Company.destroy_all

10.times do
  Company.create!(company_name: Faker::Company.name,
                  company_category: Faker::Company.industry,
                  company_website_url: 'https://www.lewagon.com')
end

Job.destroy_all

20.times do
  Job.create!(job_title: Faker::Job.title,
              job_description: Faker::Job.field,
              salary: Faker::Number.number(digits: 5),
              company_id: Company.all.sample.id,
              application_deadline: Faker::Date.between(from: '2023-12-23', to: '2024-03-22'))
end

JobApplication.destroy_all

5.times do
  JobApplication.create!(status: "Applied", user_id: User.all.sample.id, job_id: Job.all.sample.id)
end
