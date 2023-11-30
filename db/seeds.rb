puts "Deleting previous users, jobs and companies..."

User.destroy_all
Job.destroy_all
Company.destroy_all

puts "Creating new companies..."

Company.create(company_name: "Kroo",
               company_category: "Tech",
               company_website_url: "https://kroo.com/")

puts "Created company - #{Company.last.company_name}"

Company.create(company_name: "Deliveroo",
               company_category: "Tech",
               company_website_url: "https://deliveroo.co.uk/")

puts "Created company - #{Company.last.company_name}"

Company.create(company_name: "BCG Digital Ventures",
               company_category: "Tech",
               company_website_url: "https://bcgdv.com/")

puts "Created company - #{Company.last.company_name}"


puts "Creating new jobs..."

Job.create(
  job_title: "Software Engineer-Full stack (Junior Level)",
  job_description: "Kroo has a big vision. To be the first bank that is both trusted and loved by its customers.We’re helping people take control of their financial future and achieve their goals, whilst making a positive impact on the planet. Here at Kroo, doing what is right is in our DNA. We act with integrity, transparency and honesty. We think big, dream big, and relentlessly pursue our goals. We like to be bold, break new ground, and we never stop learning. But most importantly, we are on this journey together.",
  salary: 30000,
  date_created: Date.today,

  # note: this all converts to string when parsed to json in the databse
  application_criteria: {
    first_name: {
      interaction: :input,
      locators: ['firstname']
    },
    last_name: {
      interaction: :input,
      locators: ['lastname']
    },
    email: {
      interaction: :input,
      locators: ['email']
    },
    phone_number: {
      interaction: :input,
      locators: ['phone']
    },
    salary_expectation_text: {
      interaction: :input,
      locators: ['CA_18698']
    },
    salary_expectation_figure: {
      interaction: :input,
      locators: ['QA_6308628']
    },
    notice_period: {
      interaction: :input,
      locators: ['QA_6308629']
    },
    preferred_pronoun_text: {
      interaction: :input,
      locators: ['QA_6308631']
    },
    employee_referral: {
      interaction: :input,
      locators: ['QA_6427777']
    }
  },
  application_deadline: Date.today + 30,
  job_posting_url: "https://apply.workable.com/kroo/j/C51C29B6C0",
  company_id: Company.first.id)

puts "Created job - #{Job.last.job_title}"

Job.create(job_title: "Software Engineer II - Full-Stack",
           job_description: "We're building the definitive online food company, transforming the way the world eats by making hyper-local food more convenient and accessible. We obsess about building the future of food, whilst using our network as a force for good. We're at the forefront of an industry, powered by our market-leading technology and unrivalled network to bring incredible convenience and selection to our customers.",
           salary: 31000,
           date_created: Date.today,
           application_deadline: Date.today + 30,
           job_posting_url: "https://boards.greenhouse.io/deliveroo/jobs/5447359",
           company_id: Company.second.id)
puts "Created job - #{Job.last.job_title}"

Job.create(job_title: "Fullstack Engineer: Green-Tech Business",
           job_description: "Part of a new team, we are hiring software engineers to work in squads on developing applications for the company’s digital portfolio, built in the Azure ecosystem. You will play a key role in designing, developing, maintaining and improving business’ key product, thus enabling customers to measure their climate impact.",
           salary: 40000,
           date_created: Date.today,
           application_deadline: Date.today + 30,
           job_posting_url: "https://boards.greenhouse.io/bcgdv/jobs/6879714002?gh_jid=6879714002",
           company_id: Company.third.id)
puts "Created job - #{Job.last.job_title}"

puts "Creating 5 users..."

puts "Creating admins..."
User.create(email: ENV['ADMIN_EMAIL'], password: ENV['ADMIN_PASSWORD'], first_name: "Charlotte", last_name: "Boyd", address_first: "14 Knapp Drive", address_second: "London", post_code: "E1 7SH", city: "London", admin: true)
puts "Created user:  #{User.first.first_name}"
User.create(email: ENV['CHARLIE_EMAIL'], password: ENV['CHARLIE_PASSWORD'], first_name: "Charlie", last_name: "Cheesman", address_first: "Le Haynes", address_second: "London", post_code: "E5 6KK", city: "London", admin: true)
puts "Created user:  #{User.first.first_name}"

puts "Creating standard users..."
User.create(email: "email2@gmail.com", password: "password", first_name: "Ilya", last_name: "the russian hacker", address_first: "15 Hackney Drive", address_second: "London", post_code: "E1 3KR", city: "London", admin: false)
puts "Created user:  #{User.second.first_name}"
User.create(email: "email3@gmail.com", password: "password", first_name: "Direncan", last_name: "the mysterious", address_first: "15 Hackney Drive", address_second: "London", post_code: "E1 3KR", city: "London", admin: false)
puts "Created user:  #{User.third.first_name}"
User.create(email: "email4@gmail.com", password: "password", first_name: "Charlotte", last_name: "the genius", address_first: "15 Hackney Drive", address_second: "London", post_code: "E1 3KR", city: "London", admin: false)
puts "Created user:  #{User.fourth.first_name}"

5.times do |_application|
  JobApplication.create(
    status: "Pre-test",
    user_id: User.first.id,
    job_id: Job.first.id
  )
  puts "Created job application for #{User.first.first_name} for #{Job.first.job_title}"
end

puts "Created 5 Super Users"

puts Company.all
puts Job.all
puts User.all
puts JobApplication.all

puts "Done!"

PgSearch::Multisearch.rebuild(Job)
PgSearch::Multisearch.rebuild(Company)

# Test method: ApplyJob.perform_now(35, 31)
