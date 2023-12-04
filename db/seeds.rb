puts "Deleting previous users, jobs and companies..."

User.destroy_all
Job.destroy_all
Company.destroy_all

puts "Creating 20 new companies..."

Company.create(
  company_name: "Kroo",
  company_category: "Tech",
  company_website_url: "https://kroo.com/"
)

  puts "Created company - #{Company.last.company_name}"

Company.create(
  company_name: "Deliveroo",
  company_category: "Tech",
  company_website_url: "https://deliveroo.co.uk/"
)

  puts "Created company - #{Company.last.company_name}"

Company.create(
  company_name: "BCG Digital Ventures",
  company_category: "Tech",
  company_website_url: "https://bcgdv.com/"
)

puts "Created company - #{Company.last.company_name}"

Company.create(
  company_name: "Cleo",
  company_category: "FinTech",
  company_website_url: "https://web.meetcleo.com/"
)

puts "Created company - #{Company.last.company_name}"

Company.create(
  company_name: "BrainStation",
  company_category: "Tech",
  company_website_url: "https://brainstation.io/?utm_keyword=brainstation&utm_network=g&utm_matchtype=e&utm_creative=482902487505&utm_target=&utm_placement=&utm_device=c&utm_campaign=11729367089&utm_adgroup=116579494489&utm_source=AdWords&utm_target_id=kwd-296950415241&gad_source=1&gclid=CjwKCAiAjrarBhAWEiwA2qWdCAxXKzc0tpASTlQ_0z5xoqcHoLPvvpcmvMNYN0eSJ8A_t8BxnLK_EBoCBRUQAvD_BwE"
)

Company.create(
  company_name: "Blink",
  company_category: "Tech",
  company_website_url: "https://www.joinblink.com/"
)

puts "Created company - #{Company.last.company_name}"

Company.create(
  company_name: "Builder.ai",
  company_category: "Tech",
  company_website_url: "https://www.builder.ai/"
)

puts "Created company - #{Company.last.company_name}"

Company.create(
  company_name: "9fin",
  company_category: "Tech",
  company_website_url: "https://9fin.com/"
)

puts "Created company - #{Company.last.company_name}"

Company.create(
  company_name: "Quantexa",
  company_category: "Tech",
  company_website_url: "https://www.quantexa.com/"
)

  puts "Created company - #{Company.last.company_name}"

  Company.create(
  company_name: "Apple Inc",
  company_category: "Tech",
  company_website_url: "https://apple.com/uk")

  puts "Created company - #{Company.last.company_name}"

  Company.create(
  company_name: "Google",
  company_category: "Tech",
  company_website_url: "https://google.com/")

  puts "Created company - #{Company.last.company_name}"

  Company.create(
  company_name: "Meta",
  company_category: "Tech",
  company_website_url: "https://meta.com/")

  puts "Created company - #{Company.last.company_name}"

  Company.create(
  company_name: "Amazon Web Services",
  company_category: "Tech",
  company_website_url: "https://aws.com/")

  puts "Created company - #{Company.last.company_name}"

  Company.create(
  company_name: "Netflix",
  company_category: "Tech",
  company_website_url: "https://Netflix.com/")

  puts "Created company - #{Company.last.company_name}"

  Company.create(
  company_name: "EBay",
  company_category: "E-Commerce",
  company_website_url: "https://bcgdv.com/")

  puts "Created company - #{Company.last.company_name}"

  Company.create(
  company_name: "Microsoft",
  company_category: "Tech",
  company_website_url: "https://Microsoft.com/")

  puts "Created company - #{Company.last.company_name}"

  Company.create(
  company_name: "OpenAI",
  company_category: "Tech",
  company_website_url: "https://openai.com/")

  puts "Created company - #{Company.last.company_name}"

  Company.create(
  company_name: "Tesla",
  company_category: "Automotive",
  company_website_url: "https://tesla.com/")

  puts "Created company - #{Company.last.company_name}"

  Company.create(
  company_name: "BCG Digital Ventures",
  company_category: "Tech",
  company_website_url: "https://bcgdv.com/")

  puts "Created company - #{Company.last.company_name}"

  Company.create(
    company_name: "Uber",
    company_category: "Transportation Mobility",
    company_website_url: "https://bcgdv.com/")

    puts "Created company - #{Company.last.company_name}"

    Company.create(
    company_name: "Samsung",
    company_category: "Tech",
    company_website_url: "https://samsung.com/")

    puts "Created company - #{Company.last.company_name}"

    Company.create(
    company_name: "Intel",
    company_category: "Tech",
    company_website_url: "https://intel.com/")

    puts "Created company - #{Company.last.company_name}"

    Company.create(
    company_name: "Shopify",
    company_category: "E-Commerce",
    company_website_url: "https://Shopify.com/")

    puts "Created company - #{Company.last.company_name}"

    Company.create(
    company_name: "Intel",
    company_category: "Tech",
    company_website_url: "https://intel.com/")

    puts "Created company - #{Company.last.company_name}"

    Company.create(
    company_name: "Sony",
    company_category: "Electronics",
    company_website_url: "https://Sony.com/")

    puts "Created company - #{Company.last.company_name}"

    puts "creating more companies just in case :)"

    Company.create(
    company_name: "Etsy",
    company_category: "E-Commerce",
    company_website_url: "https://Etsy.com/")

    Company.create(
    company_name: "Reliance Health",
    company_category: "Healthcare",
    company_website_url: "https://reliancehealth.com/")

    Company.create(
    company_name: "OXK",
    company_category: "Crypto",
    company_website_url: "https://okx.com/")

    Company.create(
    company_name: "Cleo",
    company_category: "Finance",
    company_website_url: "https://cleo.com/")

    Company.create(
    company_name: "Kubernetes",
    company_category: "Tech",
    company_website_url: "https://kubernetes.com/")

    Company.create(
    company_name: "Forter",
    company_category: "Tech",
    company_website_url: "https://forter.com/")

    Company.create(
    company_name: "Synthesia",
    company_category: "Tech",
    company_website_url: "https://synthesia.com/")

    Company.create(
    company_name: "DRW",
    company_category: "Finance",
    company_website_url: "https://drw.com/")

    Company.create(
    company_name: "Wise",
    company_category: "Finance",
    company_website_url: "https://wise.com/")

    Company.create(
    company_name: "Elemental Excelerator",
    company_category: "Tech",
    company_website_url: "https://elementalexcelerator.com/")

    Company.create(
    company_name: "Relativity Space",
    company_category: "Tech",
    company_website_url: "https://relativityspace.com/")

    Company.create(
    company_name: "Zscaler",
    company_category: "Tech",
    company_website_url: "https://zscaler.com/")

    Company.create(
    company_name: "Mozilla",
    company_category: "Tech",
    company_website_url: "https://mozilla.com/")

    Company.create(
    company_name: "Alby",
    company_category: "Tech",
    company_website_url: "https://alby.com/")

    Company.create(
    company_name: "Forage",
    company_category: "Tech",
    company_website_url: "https://forage.com/")

    Company.create(
    company_name: "Tenstorrent",
    company_category: "Tech",
    company_website_url: "https://tenstorrent.com/")

    Company.create(
    company_name: "Jane Street",
    company_category: "Finance",
    company_website_url: "https://janestreet.com/")

    Company.create(
    company_name: "Quantexa",
    company_category: "Tech",
    company_website_url: "https://quantexa.com/")

    Company.create(
    company_name: "Brain Station",
    company_category: "Tech",
    company_website_url: "https://brainstation.com/")


puts "Created company - #{Company.last.company_name}"

puts "Creating new jobs..."

# TODO: Test filling in forms based on different locators to see what is most efficient and what works
# TODO: Add migration for additional fields in user model
# TODO: Add values for user model
# TODO: Add additional fields and change fields e.g. notice_period_weeks
# TODO: Update Job to have Job Application Fields so that we can pull those in the same format as the user model

# NB. Whenever changing a field, you need to adjust 3 places: Job Model, User Model and Default Value

Job.create(
  job_title: "Software Engineer-Full stack (Junior Level)",
  job_description: "Kroo has a big vision. To be the first bank that is both trusted and loved by its customers.We’re helping people take control of their financial future and achieve their goals, whilst making a positive impact on the planet. Here at Kroo, doing what is right is in our DNA. We act with integrity, transparency and honesty. We think big, dream big, and relentlessly pursue our goals. We like to be bold, break new ground, and we never stop learning. But most importantly, we are on this journey together.",
  salary: 30000,
  date_created: Date.today,

  # NB: THIS ALL CONVERTS TO STRING WHEN PARSED TO JSON IN THE DATABASE!

  application_criteria: {
    first_name: {
      interaction: :input,
      locators: 'firstname'
    },
    last_name: {
      interaction: :input,
      locators: 'lastname'
    },
    email: {
      interaction: :input,
      locators: 'email'
    },
    phone_number: {
      interaction: :input,
      locators: 'phone'
    },
    resume: {
      interaction: :upload,
      locators: 'input[type="file"]'
    },
    salary_expectation_text: {
      interaction: :input,
      locators: 'CA_18698'
    },
    right_to_work: {
      interaction: :radiogroup,
      locators: 'fieldset[data-ui="QA_6308627"]',
      option: "label",
    },
    salary_expectation_figure: {
      interaction: :input,
      locators: 'QA_6308628'
    },
    notice_period: {
      interaction: :input,
      locators: 'QA_6308629'
    },
    preferred_pronoun_select: {
      interaction: :combobox,
      locators: 'input#input_QA_6308630_input',
      option: "li"
    },
    preferred_pronoun_text: {
      interaction: :input,
      locators: 'QA_6308631',
    },
    employee_referral: {
      interaction: :input,
      locators: 'QA_6427777'
    }
  },
  application_deadline: Date.today + 30,
  job_posting_url: "https://apply.workable.com/kroo/j/C51C29B6C0",
  company_id: Company.find_by(company_name: 'Kroo').id
)

puts "Created job - #{Job.last.job_title}"

Job.create(
  job_title: "Software Engineer II - Full-Stack",
  job_description: "We're building the definitive online food company, transforming the way the world eats by making hyper-local food more convenient and accessible. We obsess about building the future of food, whilst using our network as a force for good. We're at the forefront of an industry, powered by our market-leading technology and unrivalled network to bring incredible convenience and selection to our customers.",
  salary: 31000,
  date_created: Date.today,
  application_criteria: {
    first_name: {
      interaction: :input,
      locators: 'first_name'
    },
    last_name: {
      interaction: :input,
      locators: 'last_name'
    },
    email: {
      interaction: :input,
      locators: 'email'
    },
    phone_number: {
      interaction: :input,
      locators: 'phone'
    },
    city: {
      interaction: :input,
      locators: 'job_application[location]'
    },
    location_click: {
      interaction: :listbox,
      locators: 'ul#location_autocomplete-items-popup'
    },
    resume: {
      interaction: :upload,
      locators: 'button[aria-describedby="resume-allowable-file-types"'
    },
    linkedin_profile: {
      interaction: :input,
      locators: 'job_application_answers_attributes_0_text_value'
    },
    require_visa?: {
      interaction: :select,
      locators: 'select#job_application_answers_attributes_1_boolean_value',
      option: 'option'
    },
    heard_of_company?: {
      interaction: :select,
      locators: 'select#job_application_answers_attributes_2_boolean_value',
      option: 'option'
    }
  },
  application_deadline: Date.today + 30,
  job_posting_url: "https://boards.greenhouse.io/deliveroo/jobs/5447359",
  company_id: Company.find_by(company_name: 'Deliveroo').id
)

puts "Created job - #{Job.last.job_title}"

Job.create(
  job_title: "Fullstack Engineer: Green-Tech Business",
  job_description: "Part of a new team, we are hiring software engineers to work in squads on developing applications for the company’s digital portfolio, built in the Azure ecosystem. You will play a key role in designing, developing, maintaining and improving business’ key product, thus enabling customers to measure their climate impact.",
  salary: 40000,
  date_created: Date.today,
  application_criteria: {
    first_name: {
      interaction: :input,
      locators: 'first_name'
    },
    last_name: {
      interaction: :input,
      locators: 'last_name'
    },
    email: {
      interaction: :input,
      locators: 'email'
    },
    phone_number: {
      interaction: :input,
      locators: 'phone'
    },
    city: {
      interaction: :input,
      locators: 'job_application[location]'
    },
    location_click: {
      interaction: :listbox,
      locators: 'ul#location_autocomplete-items-popup'
    },
    resume: {
      interaction: :upload,
      locators: 'button[aria-describedby="resume-allowable-file-types"'
    },
    linkedin_profile: {
      interaction: :input,
      locators: 'job_application_answers_attributes_0_text_value'
    },
    personal_website: {
      interaction: :input,
      locators: 'job_application_answers_attributes_1_text_value'
    },
    heard_from: {
      interaction: :input,
      locators: 'job_application_answers_attributes_2_text_value'
    },
    right_to_work: {
      interaction: :select,
      locators: 'select#job_application_answers_attributes_3_boolean_value',
      option: 'option'
    },
    require_visa?: {
      interaction: :select,
      locators: 'select#job_application_answers_attributes_4_boolean_value',
      option: 'option'
    }
  },
  application_deadline: Date.today + 30,
  job_posting_url: "https://boards.greenhouse.io/bcgdv/jobs/6879714002?gh_jid=6879714002",
  company_id: Company.find_by(company_name: 'BCG Digital Ventures').id
)

puts "Created job - #{Job.last.job_title}"

Job.create(
  job_title: "Software Engineer - Golang",
  job_description: "We're building the definitive online food company, transforming the way the world eats by making hyper-local food more convenient and accessible. We obsess about building the future of food, whilst using our network as a force for good. We're at the forefront of an industry, powered by our market-leading technology and unrivaled network to bring incredible convenience and selection to our customers.",
  salary: 40000,
  date_created: Date.today,
  application_deadline: Date.today + 30,
  job_posting_url: "https://boards.greenhouse.io/deliveroo/jobs/5094403?utm_source=trueup&utm_medium=website&ref=trueup",
  company_id: Company.find_by(company_name: 'Deliveroo').id
)

puts "Created job - #{Job.last.job_title}"

Job.create(
  job_title: "Backend Ruby Engineer",
  job_description: "Most people come to Cleo to do work that matters. Every day, we empower people to build a life beyond their next paycheck, building a beloved AI that enables you to forge your own path toward financial well-being.",
  salary: 40000,
  date_created: Date.today,
  application_deadline: Date.today + 30,
  job_posting_url: "https://boards.greenhouse.io/cleoai/jobs/5033034002?utm_source=trueup&utm_medium=website&ref=trueup",
  company_id: Company.find_by(company_name: 'Cleo').id
)

puts "Created job - #{Job.last.job_title}"

Job.create(
  job_title: "Educator, Web Developer",
  job_description: "BrainStation is a global leader in digital skills training and development, offering a 12-week bootcamp program in Web Development. BrainStation is currently hiring a Senior Web Developer to teach our program through online and in-person teaching. BrainStation Educators are given the unique opportunity to teach, research, and further develop their skills, while teaching in a dynamic, project-based setting.",
  salary: 40000,
  date_created: Date.today,
  application_deadline: Date.today + 30,
  job_posting_url: "https://boards.greenhouse.io/brainstation/jobs/5802728003?utm_source=trueup&utm_medium=website&ref=trueup",
  company_id: Company.find_by(company_name: 'BrainStation').id
)

puts "Created job - #{Job.last.job_title}"

Job.create(
  job_title: "Frontend Engineer",
  job_description: "Blink is the world’s first workplace tool designed for frontline employees. Our award-winning platform transforms the working lives of society's most relied-on members.",
  salary: 40000,
  date_created: Date.today,
  application_deadline: Date.today + 30,
  job_posting_url: "https://apply.workable.com/joinblink/j/C75195FF87/",
  company_id: Company.find_by(company_name: 'Blink').id
)

puts "Created job - #{Job.last.job_title}"

Job.create(
  job_title: "Full Stack Software Engineer - React/Node",
  job_description: "We’re on a mission to make app building so easy everyone can do it – regardless of their background, tech knowledge or budget. We’ve already helped thousands of entrepreneurs, small businesses and even global brands, like the BBC, Makro and Pepsi achieve their software goals and we’ve only just started.",
  salary: 40000,
  date_created: Date.today,
  application_deadline: Date.today + 30,
  job_posting_url: "https://apply.workable.com/builderai/j/DD834B7F18/",
  company_id: Company.find_by(company_name: 'Builder.ai').id
)

puts "Created job - #{Job.last.job_title}"

Job.create(
  job_title: "Software Engineer (Backend-Web Platforms)",
  job_description: "Technology has revolutionized equity markets with electronic trading, quant algos and instantaneous news. However, in debt capital markets, the picture is completely different. It still behaves like it’s in the 1980s; trillions of dollars of trades are placed over the phone, news is slow, and corporate credit information is imperfect and scattered.",
  salary: 40000,
  date_created: Date.today,
  application_deadline: Date.today + 30,
  job_posting_url: "https://apply.workable.com/9fin/j/437E57E57C/",
  company_id: Company.find_by(company_name: '9fin').id
)

puts "Created job - #{Job.last.job_title}"

Job.create(
  job_title: "Front End Engineer",
  job_description: "At Quantexa we believe that people and organizations make better decisions when those decisions are put in context – we call this Contextual Decision Intelligence. Contextual Decision Intelligence is the new approach to data analysis that shows the relationships between people, places and organizations - all in one place - so you gain the context you need to make more accurate decisions, faster.",
  salary: 40000,
  date_created: Date.today,
  application_deadline: Date.today + 30,
  job_posting_url: "https://apply.workable.com/quantexa/j/BFDDA845A0/?utm_source=trueup&utm_medium=website&ref=trueup",
  company_id: Company.find_by(company_name: 'Quantexa').id
)

puts "Created job - #{Job.last.job_title}"

Job.create(
  job_title: "Backend Ruby Engineer",
  job_description: "Most people come to Cleo to do work that matters. Every day, we empower people to build a life beyond their next paycheck, building a beloved AI that enables you to forge your own path toward financial well-being.",
  salary: 40000,
  date_created: Date.today,
  application_deadline: Date.today + 30,
  job_posting_url: "https://boards.greenhouse.io/cleoai/jobs/5033034002?utm_source=trueup&utm_medium=website&ref=trueup",
  company_id: Company.find_by(company_name: 'Cleo').id)

Job.create(
  job_title: "Software Engineer @ Deliveroo",
  job_description: "As a Software Engineer on the Ads team at Deliveroo, your individual work contributes to achieving goals in and across your team. While you will work with your team and you may lead projects, some of your work will contribute outside of your direct remit. You will report to managers and group leads and together deliver the results.",
  salary: 28500,
  date_created: Date.today,

  # NB: THIS ALL CONVERTS TO STRING WHEN PARSED TO JSON IN THE DATABASE!

  application_criteria: {
    first_name: {
      interaction: :input,
      locators: 'firstname'
    },
    last_name: {
      interaction: :input,
      locators: 'lastname'
    },
    email: {
      interaction: :input,
      locators: 'email'
    },
    phone_number: {
      interaction: :input,
      locators: 'phone'
    },
    resume: {
      interaction: :upload,
      locators: 'input[type="file"]'
    },
    salary_expectation_text: {
      interaction: :input,
      locators: ''
    },
    right_to_work: {
      interaction: :radiogroup,
      locators: '',
      option: "",
    },
    salary_expectation_figure: {
      interaction: :input,
      locators: ''
    },
    notice_period: {
      interaction: :input,
      locators: ''
    },
    preferred_pronoun_select: {
      interaction: :combobox,
      locators: '',
      option: ""
    },
    preferred_pronoun_text: {
      interaction: :input,
      locators: '',
    },
    employee_referral: {
      interaction: :input,
      locators: ''
    }
  },
  application_deadline: Date.today + 30,
  job_posting_url: "https://boards.greenhouse.io/deliveroo/jobs/5094403?utm_source=trueup&utm_medium=website&ref=trueup",
  company_id: Company.find_by(company_name: 'Deliveroo').id)

puts "Created job - #{Job.last.job_title}"

Job.create(
  job_title: "Software Engineer (Frontend) @ Reliance Health",
  job_description: "As a Software Engineer at Reliance Health, you will play a pivotal role in developing, maintaining and optimizing the software used by our customers, our staff and our healthcare partners",
  salary: 33000,
  date_created: Date.today,

  # NB: THIS ALL CONVERTS TO STRING WHEN PARSED TO JSON IN THE DATABASE!

  application_criteria: {
    first_name: {
      interaction: :input,
      locators: 'firstname'
    },
    last_name: {
      interaction: :input,
      locators: 'lastname'
    },
    email: {
      interaction: :input,
      locators: 'email'
    },
    phone_number: {
      interaction: :input,
      locators: 'phone'
    },
    resume: {
      interaction: :upload,
      locators: 'input[type="file"]'
    },
    salary_expectation_text: {
      interaction: :input,
      locators: ''
    },
    right_to_work: {
      interaction: :radiogroup,
      locators: '',
      option: "",
    },
    salary_expectation_figure: {
      interaction: :input,
      locators: ''
    },
    notice_period: {
      interaction: :input,
      locators: ''
    },
    preferred_pronoun_select: {
      interaction: :combobox,
      locators: '',
      option: ""
    },
    preferred_pronoun_text: {
      interaction: :input,
      locators: '',
    },
    employee_referral: {
      interaction: :input,
      locators: ''
    }
  },
  application_deadline: Date.today + 30,
  job_posting_url: "https://apply.workable.com/get-reliance-health/j/26CF020B41/apply/",
  company_id: Company.find_by(company_name: 'Reliance Health').id)
puts "Created job - #{Job.last.job_title}"


Job.create(
  job_title: "Senior Engineer - Java (Defi - DEX) @ OKX ",
  job_description: "We are looking for a Senior Engineer - Java (Defi - DEX) to join our team and help us build the future of work. You will be working closely with our product and design teams to build and improve our web application. ",
  salary: 34000,
  date_created: Date.today,

  # NB: THIS ALL CONVERTS TO STRING WHEN PARSED TO JSON IN THE DATABASE!

  application_criteria: {
    first_name: {
      interaction: :input,
      locators: 'firstname'
    },
    last_name: {
      interaction: :input,
      locators: 'lastname'
    },
    email: {
      interaction: :input,
      locators: 'email'
    },
    phone_number: {
      interaction: :input,
      locators: 'phone'
    },
    resume: {
      interaction: :upload,
      locators: 'input[type="file"]'
    },
    salary_expectation_text: {
      interaction: :input,
      locators: ''
    },
    right_to_work: {
      interaction: :radiogroup,
      locators: '',
      option: "",
    },
    salary_expectation_figure: {
      interaction: :input,
      locators: ''
    },
    notice_period: {
      interaction: :input,
      locators: ''
    },
    preferred_pronoun_select: {
      interaction: :combobox,
      locators: '',
      option: ""
    },
    preferred_pronoun_text: {
      interaction: :input,
      locators: '',
    },
    employee_referral: {
      interaction: :input,
      locators: ''
    }
  },
  application_deadline: Date.today + 30,
  job_posting_url: "https://boards.greenhouse.io/okx/jobs/5552949003?utm_source=trueup&utm_medium=website&ref=trueup#app",
  company_id: Company.find_by(company_name: 'OXK').id)
puts "Created job - #{Job.last.job_title}"

Job.create(
  job_title: "Senior Engineer @ Kubernetes Core Interfacesat CoreWeave ",
  job_description: "We are looking for a Senior Engineer - Java (Defi - DEX) to join our team and help us build the future of work. You will be working closely with our product and design teams to build and improve our web application. ",
  salary: 38000,
  date_created: Date.today,

  # NB: THIS ALL CONVERTS TO STRING WHEN PARSED TO JSON IN THE DATABASE!

  application_criteria: {
    first_name: {
      interaction: :input,
      locators: 'firstname'
    },
    last_name: {
      interaction: :input,
      locators: 'lastname'
    },
    email: {
      interaction: :input,
      locators: 'email'
    },
    phone_number: {
      interaction: :input,
      locators: 'phone'
    },
    resume: {
      interaction: :upload,
      locators: 'input[type="file"]'
    },
    salary_expectation_text: {
      interaction: :input,
      locators: ''
    },
    right_to_work: {
      interaction: :radiogroup,
      locators: '',
      option: "",
    },
    salary_expectation_figure: {
      interaction: :input,
      locators: ''
    },
    notice_period: {
      interaction: :input,
      locators: ''
    },
    preferred_pronoun_select: {
      interaction: :combobox,
      locators: '',
      option: ""
    },
    preferred_pronoun_text: {
      interaction: :input,
      locators: '',
    },
    employee_referral: {
      interaction: :input,
      locators: ''
    }
  },
  application_deadline: Date.today + 30,
  job_posting_url: "https://boards.greenhouse.io/coreweave/jobs/4241710006?utm_source=trueup&utm_medium=website&ref=trueup#app",
  company_id: Company.find_by(company_name: 'Kubernetes').id)
puts "Created job - #{Job.last.job_title}"

Job.create(
  job_title: "Backend Payment Architech @ Forter",
  job_description: "Payment System Analysis: Conduct payment solution technical requirement deep dives with clients to understand their business goals",
  salary: 43000,
  date_created: Date.today,

  # NB: THIS ALL CONVERTS TO STRING WHEN PARSED TO JSON IN THE DATABASE!

  application_criteria: {
    first_name: {
      interaction: :input,
      locators: 'firstname'
    },
    last_name: {
      interaction: :input,
      locators: 'lastname'
    },
    email: {
      interaction: :input,
      locators: 'email'
    },
    phone_number: {
      interaction: :input,
      locators: 'phone'
    },
    resume: {
      interaction: :upload,
      locators: 'input[type="file"]'
    },
    salary_expectation_text: {
      interaction: :input,
      locators: ''
    },
    right_to_work: {
      interaction: :radiogroup,
      locators: '',
      option: "",
    },
    salary_expectation_figure: {
      interaction: :input,
      locators: ''
    },
    notice_period: {
      interaction: :input,
      locators: ''
    },
    preferred_pronoun_select: {
      interaction: :combobox,
      locators: '',
      option: ""
    },
    preferred_pronoun_text: {
      interaction: :input,
      locators: '',
    },
    employee_referral: {
      interaction: :input,
      locators: ''
    }
  },
  application_deadline: Date.today + 30,
  job_posting_url: "https://boards.greenhouse.io/forter/jobs/6889370002?utm_source=trueup&utm_medium=website&ref=trueup#app",
  company_id: Company.find_by(company_name: 'Forter').id)
puts "Created job - #{Job.last.job_title}"

Job.create(
  job_title: "Webflow Developer @ Synthesia ",
  job_description: "Support full-stack engineering teams, Communicate across functions and drive engineering initiatives,Empathise with and help define product strategy for our target audience.",
  salary: 41000,
  date_created: Date.today,

  # NB: THIS ALL CONVERTS TO STRING WHEN PARSED TO JSON IN THE DATABASE!

  application_criteria: {
    first_name: {
      interaction: :input,
      locators: 'firstname'
    },
    last_name: {
      interaction: :input,
      locators: 'lastname'
    },
    email: {
      interaction: :input,
      locators: 'email'
    },
    phone_number: {
      interaction: :input,
      locators: 'phone'
    },
    resume: {
      interaction: :upload,
      locators: 'input[type="file"]'
    },
    salary_expectation_text: {
      interaction: :input,
      locators: ''
    },
    right_to_work: {
      interaction: :radiogroup,
      locators: '',
      option: "",
    },
    salary_expectation_figure: {
      interaction: :input,
      locators: ''
    },
    notice_period: {
      interaction: :input,
      locators: ''
    },
    preferred_pronoun_select: {
      interaction: :combobox,
      locators: '',
      option: ""
    },
    preferred_pronoun_text: {
      interaction: :input,
      locators: '',
    },
    employee_referral: {
      interaction: :input,
      locators: ''
    }
  },
  application_deadline: Date.today + 30,
  job_posting_url: "https://boards.eu.greenhouse.io/synthesia/jobs/4250474101?gh_jid=4250474101&utm_source=trueup&utm_medium=website&ref=trueup#app",
  company_id: Company.find_by(company_name: 'Synthesia').id)
puts "Created job - #{Job.last.job_title}"

puts "Createad 10 jobs"

puts "Creating another 10 jobs..."

Job.create(
  job_title: "Software Engineer - Commodities @ DRW   ",
  job_description: "DRW are looking for a Software Engineer to join the Commodities trading group to build and support data pipelines for the ingestion, management, and analysis of datasets used by analysts and traders.",
  salary: 60000,
  date_created: Date.today,

  # NB: THIS ALL CONVERTS TO STRING WHEN PARSED TO JSON IN THE DATABASE!

  application_criteria: {
    first_name: {
      interaction: :input,
      locators: 'firstname'
    },
    last_name: {
      interaction: :input,
      locators: 'lastname'
    },
    email: {
      interaction: :input,
      locators: 'email'
    },
    phone_number: {
      interaction: :input,
      locators: 'phone'
    },
    resume: {
      interaction: :upload,
      locators: 'input[type="file"]'
    },
    salary_expectation_text: {
      interaction: :input,
      locators: ''
    },
    right_to_work: {
      interaction: :radiogroup,
      locators: '',
      option: "",
    },
    salary_expectation_figure: {
      interaction: :input,
      locators: ''
    },
    notice_period: {
      interaction: :input,
      locators: ''
    },
    preferred_pronoun_select: {
      interaction: :combobox,
      locators: '',
      option: ""
    },
    preferred_pronoun_text: {
      interaction: :input,
      locators: '',
    },
    employee_referral: {
      interaction: :input,
      locators: ''
    }
  },
  application_deadline: Date.today + 30,
  job_posting_url: "https://boards.greenhouse.io/drweng/jobs/5345753?utm_source=trueup&utm_medium=website&ref=trueup#app",
  company_id: Company.find_by(company_name: 'DRW').id)
puts "Created job - #{Job.last.job_title}"

Job.create(
  job_title: "Senior Backend Engineer - Fraud @ Wise",
  job_description: "We’re looking for a Senior Backend Engineer to join our Fraud team in London. You’ll be working on building and improving our fraud detection systems, which are used to protect our customers and Wise from fraudsters. You’ll be working in a cross-functional team with other engineers, product managers, data scientists and analysts to build and improve our fraud detection systems.",
  salary: 55000,
  date_created: Date.today,

  # NB: THIS ALL CONVERTS TO STRING WHEN PARSED TO JSON IN THE DATABASE!

  application_criteria: {
    first_name: {
      interaction: :input,
      locators: 'firstname'
    },
    last_name: {
      interaction: :input,
      locators: 'lastname'
    },
    email: {
      interaction: :input,
      locators: 'email'
    },
    phone_number: {
      interaction: :input,
      locators: 'phone'
    },
    resume: {
      interaction: :upload,
      locators: 'input[type="file"]'
    },
    salary_expectation_text: {
      interaction: :input,
      locators: ''
    },
    right_to_work: {
      interaction: :radiogroup,
      locators: '',
      option: "",
    },
    salary_expectation_figure: {
      interaction: :input,
      locators: ''
    },
    notice_period: {
      interaction: :input,
      locators: ''
    },
    preferred_pronoun_select: {
      interaction: :combobox,
      locators: '',
      option: ""
    },
    preferred_pronoun_text: {
      interaction: :input,
      locators: '',
    },
    employee_referral: {
      interaction: :input,
      locators: ''
    }
  },
  application_deadline: Date.today + 30,
  job_posting_url: "https://boards.greenhouse.io/transferwise/jobs/5082330?utm_source=trueup&utm_medium=website&ref=trueup",
  company_id: Company.find_by(company_name: 'Wise').id)
puts "Created job - #{Job.last.job_title}"

Job.create(
  job_title: "Developer in Residence @ Elemental Excelerator ",
  job_description: "We are looking for a Developer in Residence to join our team and help us build the future of work. You will be working closely with our product and design teams to build and improve our web application. ",
  salary: 29000,
  date_created: Date.today,

  # NB: THIS ALL CONVERTS TO STRING WHEN PARSED TO JSON IN THE DATABASE!

  application_criteria: {
    first_name: {
      interaction: :input,
      locators: 'firstname'
    },
    last_name: {
      interaction: :input,
      locators: 'lastname'
    },
    email: {
      interaction: :input,
      locators: 'email'
    },
    phone_number: {
      interaction: :input,
      locators: 'phone'
    },
    resume: {
      interaction: :upload,
      locators: 'input[type="file"]'
    },
    salary_expectation_text: {
      interaction: :input,
      locators: ''
    },
    right_to_work: {
      interaction: :radiogroup,
      locators: '',
      option: "",
    },
    salary_expectation_figure: {
      interaction: :input,
      locators: ''
    },
    notice_period: {
      interaction: :input,
      locators: ''
    },
    preferred_pronoun_select: {
      interaction: :combobox,
      locators: '',
      option: ""
    },
    preferred_pronoun_text: {
      interaction: :input,
      locators: '',
    },
    employee_referral: {
      interaction: :input,
      locators: ''
    }
  },
  application_deadline: Date.today + 30,
  job_posting_url: "https://boards.greenhouse.io/elementalexcelerator/jobs/5027131004?utm_source=trueup&utm_medium=website&ref=trueup#app",
  company_id: Company.find_by(company_name: 'Elemental Excelerator').id)
puts "Created job - #{Job.last.job_title}"

Job.create(
  job_title: "Manager, Tooling Engineering @ Relativity Space",
  job_description: "We are looking for a Manager, Tooling Engineering to join our team and help us build the future of work. You will be working closely with our product and design teams to build and improve our web application. ",
  salary: 60000,
  date_created: Date.today,

  # NB: THIS ALL CONVERTS TO STRING WHEN PARSED TO JSON IN THE DATABASE!

  application_criteria: {
    first_name: {
      interaction: :input,
      locators: 'firstname'
    },
    last_name: {
      interaction: :input,
      locators: 'lastname'
    },
    email: {
      interaction: :input,
      locators: 'email'
    },
    phone_number: {
      interaction: :input,
      locators: 'phone'
    },
    resume: {
      interaction: :upload,
      locators: 'input[type="file"]'
    },
    salary_expectation_text: {
      interaction: :input,
      locators: ''
    },
    right_to_work: {
      interaction: :radiogroup,
      locators: '',
      option: "",
    },
    salary_expectation_figure: {
      interaction: :input,
      locators: ''
    },
    notice_period: {
      interaction: :input,
      locators: ''
    },
    preferred_pronoun_select: {
      interaction: :combobox,
      locators: '',
      option: ""
    },
    preferred_pronoun_text: {
      interaction: :input,
      locators: '',
    },
    employee_referral: {
      interaction: :input,
      locators: ''
    }
  },
  application_deadline: Date.today + 30,
  job_posting_url: "https://boards.greenhouse.io/relativity/jobs/6916371002?gh_jid=6916371002&utm_source=trueup&utm_medium=website&ref=trueup#app",
  company_id: Company.find_by(company_name: 'Relativity Space').id)
puts "Created job - #{Job.last.job_title}"

Job.create(
  job_title: "Senior Infrastructure Deployment Engineer @ Zscaler ",
  job_description: "We are looking for a Senior Infrastructure Deployment Engineer to join our team and help us build the future of work. You will be working closely with our product and design teams to build and improve our web application. ",
  salary: 45000,
  date_created: Date.today,

  # NB: THIS ALL CONVERTS TO STRING WHEN PARSED TO JSON IN THE DATABASE!

  application_criteria: {
    first_name: {
      interaction: :input,
      locators: 'firstname'
    },
    last_name: {
      interaction: :input,
      locators: 'lastname'
    },
    email: {
      interaction: :input,
      locators: 'email'
    },
    phone_number: {
      interaction: :input,
      locators: 'phone'
    },
    resume: {
      interaction: :upload,
      locators: 'input[type="file"]'
    },
    salary_expectation_text: {
      interaction: :input,
      locators: ''
    },
    right_to_work: {
      interaction: :radiogroup,
      locators: '',
      option: "",
    },
    salary_expectation_figure: {
      interaction: :input,
      locators: ''
    },
    notice_period: {
      interaction: :input,
      locators: ''
    },
    preferred_pronoun_select: {
      interaction: :combobox,
      locators: '',
      option: ""
    },
    preferred_pronoun_text: {
      interaction: :input,
      locators: '',
    },
    employee_referral: {
      interaction: :input,
      locators: ''
    }
  },
  application_deadline: Date.today + 30,
  job_posting_url: "https://boards.greenhouse.io/zscaler/jobs/4092460007?utm_source=trueup&utm_medium=website&ref=trueup#app",
  company_id: Company.find_by(company_name: 'Zscaler').id)
puts "Created job - #{Job.last.job_title}"

Job.create(
  job_title: "Staff Full Stack Software Engineer @ Mozilla",
  job_description: "We are looking for a Staff Full Stack Software Engineer to join our team and help us build the future of work. You will be working closely with our product and design teams to build and improve our web application. ",
  salary: 81000,
  date_created: Date.today,

  # NB: THIS ALL CONVERTS TO STRING WHEN PARSED TO JSON IN THE DATABASE!

  application_criteria: {
    first_name: {
      interaction: :input,
      locators: 'firstname'
    },
    last_name: {
      interaction: :input,
      locators: 'lastname'
    },
    email: {
      interaction: :input,
      locators: 'email'
    },
    phone_number: {
      interaction: :input,
      locators: 'phone'
    },
    resume: {
      interaction: :upload,
      locators: 'input[type="file"]'
    },
    salary_expectation_text: {
      interaction: :input,
      locators: ''
    },
    right_to_work: {
      interaction: :radiogroup,
      locators: '',
      option: "",
    },
    salary_expectation_figure: {
      interaction: :input,
      locators: ''
    },
    notice_period: {
      interaction: :input,
      locators: ''
    },
    preferred_pronoun_select: {
      interaction: :combobox,
      locators: '',
      option: ""
    },
    preferred_pronoun_text: {
      interaction: :input,
      locators: '',
    },
    employee_referral: {
      interaction: :input,
      locators: ''
    }
  },
  application_deadline: Date.today + 30,
  job_posting_url: "https://boards.greenhouse.io/mozilla/jobs/5448569?utm_source=trueup&utm_medium=website&ref=trueup#app",
  company_id: Company.find_by(company_name: 'Mozilla').id)
puts "Created job - #{Job.last.job_title}"

Job.create(
  job_title: "Web Engineer - Content @ Ably",
  job_description: "You will be responsible for helping shape the future of our content marketing and publishing platforms. You’ll draw on your broad range of expertise across the web stack to design, develop and deliver.",
  salary: 48000,
  date_created: Date.today,

  # NB: THIS ALL CONVERTS TO STRING WHEN PARSED TO JSON IN THE DATABASE!

  application_criteria: {
    first_name: {
      interaction: :input,
      locators: 'firstname'
    },
    last_name: {
      interaction: :input,
      locators: 'lastname'
    },
    email: {
      interaction: :input,
      locators: 'email'
    },
    phone_number: {
      interaction: :input,
      locators: 'phone'
    },
    resume: {
      interaction: :upload,
      locators: 'input[type="file"]'
    },
    salary_expectation_text: {
      interaction: :input,
      locators: ''
    },
    right_to_work: {
      interaction: :radiogroup,
      locators: '',
      option: "",
    },
    salary_expectation_figure: {
      interaction: :input,
      locators: ''
    },
    notice_period: {
      interaction: :input,
      locators: ''
    },
    preferred_pronoun_select: {
      interaction: :combobox,
      locators: '',
      option: ""
    },
    preferred_pronoun_text: {
      interaction: :input,
      locators: '',
    },
    employee_referral: {
      interaction: :input,
      locators: ''
    }
  },
  application_deadline: Date.today + 30,
  job_posting_url: "https://boards.eu.greenhouse.io/ably30/jobs/4183821101?utm_source=trueup&utm_medium=website&ref=trueup#app",
  company_id: Company.find_by(company_name: 'Alby').id)
puts "Created job - #{Job.last.job_title}"

Job.create(
  job_title: "Principal Backend Engineer @ Forage",
  job_description: "We are looking for a Principal Backend Engineer to join our team and help us build the future of work. You will be working closely with our product and design teams to build and improve our web application. ",
  salary: 55000,
  date_created: Date.today,

  # NB: THIS ALL CONVERTS TO STRING WHEN PARSED TO JSON IN THE DATABASE!

  application_criteria: {
    first_name: {
      interaction: :input,
      locators: 'firstname'
    },
    last_name: {
      interaction: :input,
      locators: 'lastname'
    },
    email: {
      interaction: :input,
      locators: 'email'
    },
    phone_number: {
      interaction: :input,
      locators: 'phone'
    },
    resume: {
      interaction: :upload,
      locators: 'input[type="file"]'
    },
    salary_expectation_text: {
      interaction: :input,
      locators: ''
    },
    right_to_work: {
      interaction: :radiogroup,
      locators: '',
      option: "",
    },
    salary_expectation_figure: {
      interaction: :input,
      locators: ''
    },
    notice_period: {
      interaction: :input,
      locators: ''
    },
    preferred_pronoun_select: {
      interaction: :combobox,
      locators: '',
      option: ""
    },
    preferred_pronoun_text: {
      interaction: :input,
      locators: '',
    },
    employee_referral: {
      interaction: :input,
      locators: ''
    }
  },
  application_deadline: Date.today + 30,


  job_posting_url: "https://boards.greenhouse.io/joinforage/jobs/4155367007?utm_source=trueup&utm_medium=website&ref=trueup#app",
  company_id: Company.find_by(company_name: 'Forage').id)

puts "Created job - #{Job.last.job_title}"

Job.create(
  job_title: "FPGA Engineer @ Jane Street",
  job_description: "We are looking for a FPGA Engineer to join our team and help us build the future of work. You will be working closely with our product and design teams to build and improve our web application. ",
  salary: 43000,
  date_created: Date.today,

  # NB: THIS ALL CONVERTS TO STRING WHEN PARSED TO JSON IN THE DATABASE!

  application_criteria: {
    first_name: {
      interaction: :input,
      locators: 'firstname'
    },
    last_name: {
      interaction: :input,
      locators: 'lastname'
    },
    email: {
      interaction: :input,
      locators: 'email'
    },
    phone_number: {
      interaction: :input,
      locators: 'phone'
    },
    resume: {
      interaction: :upload,
      locators: 'input[type="file"]'
    },
    salary_expectation_text: {
      interaction: :input,
      locators: ''
    },
    right_to_work: {
      interaction: :radiogroup,
      locators: '',
      option: "",
    },
    salary_expectation_figure: {
      interaction: :input,
      locators: ''
    },
    notice_period: {
      interaction: :input,
      locators: ''
    },
    preferred_pronoun_select: {
      interaction: :combobox,
      locators: '',
      option: ""
    },
    preferred_pronoun_text: {
      interaction: :input,
      locators: '',
    },
    employee_referral: {
      interaction: :input,
      locators: ''
    }
  },
  application_deadline: Date.today + 30,
  job_posting_url: "https://boards.greenhouse.io/janestreet/jobs/4274809002?utm_source=trueup&utm_medium=website&ref=trueup#app",
  company_id: Company.find_by(company_name: 'Jane Street').id)
puts "Created job - #{Job.last.job_title}"

Job.create(
  job_title: "Staff Emulation Methodology and Infrastructure Engineer @ Tenstorrent",
  job_description: "We are looking for a UI Developer to join our team and help us build the future of work. You will be working closely with our product and design teams to build and improve our web application",
  salary: 35000,
  date_created: Date.today,

  # NB: THIS ALL CONVERTS TO STRING WHEN PARSED TO JSON IN THE DATABASE!

  application_criteria: {
    first_name: {
      interaction: :input,
      locators: 'firstname'
    },
    last_name: {
      interaction: :input,
      locators: 'lastname'
    },
    email: {
      interaction: :input,
      locators: 'email'
    },
    phone_number: {
      interaction: :input,
      locators: 'phone'
    },
    resume: {
      interaction: :upload,
      locators: 'input[type="file"]'
    },
    salary_expectation_text: {
      interaction: :input,
      locators: ''
    },
    right_to_work: {
      interaction: :radiogroup,
      locators: '',
      option: "",
    },
    salary_expectation_figure: {
      interaction: :input,
      locators: ''
    },
    notice_period: {
      interaction: :input,
      locators: ''
    },
    preferred_pronoun_select: {
      interaction: :combobox,
      locators: '',
      option: ""
    },
    preferred_pronoun_text: {
      interaction: :input,
      locators: '',
    },
    employee_referral: {
      interaction: :input,
      locators: ''
    }
  },
  application_deadline: Date.today + 30,
  job_posting_url: "https://boards.greenhouse.io/tenstorrent/jobs/4120628007?utm_source=trueup&utm_medium=website&ref=trueup#app",
  company_id: Company.find_by(company_name: 'Tenstorrent').id)
puts "Created job - #{Job.last.job_title}"

Job.create(
  job_title: "Software Engineer - Golang",
  job_description: "We're building the definitive online food company, transforming the way the world eats by making hyper-local food more convenient and accessible. We obsess about building the future of food, whilst using our network as a force for good. We're at the forefront of an industry, powered by our market-leading technology and unrivaled network to bring incredible convenience and selection to our customers.",
  salary: 40000,
  date_created: Date.today,
  application_deadline: Date.today + 30,
  job_posting_url: "https://boards.greenhouse.io/deliveroo/jobs/5094403?utm_source=trueup&utm_medium=website&ref=trueup",
  company_id: Company.find_by(company_name: 'Deliveroo').id
)



puts "Created job - #{Job.last.job_title}"

Job.create(
  job_title: "Educator, Web Developer",
  job_description: "BrainStation is a global leader in digital skills training and development, offering a 12-week bootcamp program in Web Development. BrainStation is currently hiring a Senior Web Developer to teach our program through online and in-person teaching. BrainStation Educators are given the unique opportunity to teach, research, and further develop their skills, while teaching in a dynamic, project-based setting.",
  salary: 40000,
  date_created: Date.today,
  application_deadline: Date.today + 30,
  job_posting_url: "https://boards.greenhouse.io/brainstation/jobs/5802728003?utm_source=trueup&utm_medium=website&ref=trueup",
  company_id: Company.find_by(company_name: 'Brain Station').id
)

puts "Created job - #{Job.last.job_title}"

# Job.create(
#   job_title: "Frontend Engineer",
#   job_description: "Blink is the world's first workplace tool designed for frontline employees. Our award-winning platform transforms the working lives of society's most relied-on members.",
#   salary: 40000,
#   date_created: Date.today,
#   application_deadline: Date.today + 30,
#   job_posting_url: "https://apply.workable.com/joinblink/j/C75195FF87/",
#   company_id: Company.find_by(company_name: 'Blink').id
# )

puts "Created job - #{Job.last.job_title}"

# Job.create(
#   job_title: "Full Stack Software Engineer - React/Node",
#   job_description: "We're on a mission to make app building so easy everyone can do it – regardless of their background, tech knowledge or budget. We've already helped thousands of entrepreneurs, small businesses and even global brands, like the BBC, Makro and Pepsi achieve their software goals and we've only just started.",
#   salary: 40000,
#   date_created: Date.today,
#   application_deadline: Date.today + 30,
#   job_posting_url: "https://apply.workable.com/builderai/j/DD834B7F18/",
#   company_id: Company.find_by(company_name: 'Builder.ai').id
# )

puts "Created job - #{Job.last.job_title}"

# Job.create(
#   job_title: "Software Engineer (Backend-Web Platforms)",
#   job_description: "Technology has revolutionized equity markets with electronic trading, quant algos and instantaneous news. However, in debt capital markets, the picture is completely different. It still behaves like it's in the 1980s; trillions of dollars of trades are placed over the phone, news is slow, and corporate credit information is imperfect and scattered.",
#   salary: 40000,
#   date_created: Date.today,
#   application_deadline: Date.today + 30,
#   job_posting_url: "https://apply.workable.com/9fin/j/437E57E57C/",
#   company_id: Company.find_by(company_name: '9fin').id
# )

puts "Created job - #{Job.last.job_title}"

Job.create(
  job_title: "Front End Engineer",
  job_description: "At Quantexa we believe that people and organizations make better decisions when those decisions are put in context – we call this Contextual Decision Intelligence. Contextual Decision Intelligence is the new approach to data analysis that shows the relationships between people, places and organizations - all in one place - so you gain the context you need to make more accurate decisions, faster.",
  salary: 40000,
  date_created: Date.today,
  application_deadline: Date.today + 30,
  job_posting_url: "https://apply.workable.com/quantexa/j/BFDDA845A0/?utm_source=trueup&utm_medium=website&ref=trueup",
  company_id: Company.find_by(company_name: 'Quantexa').id
)






puts "Creating 5 users..."

puts "Creating admins..."

# Admin user
User.create(
  email: ENV['ADMIN_EMAIL'],
  password: ENV['ADMIN_PASSWORD'],
  first_name: "Charlotte",
  last_name: "Boyd",
  phone_number: "+447874943555",
  address_first: "14 Knapp Drive",
  address_second: "London",
  post_code: "E1 7SH",
  city: "London",
  # resume: "public/Obtretetskiy_cv.pdf",
  salary_expectation_text: "£30,000 - £40,000",
  # right_to_work: /yes/i,
  salary_expectation_figure: 30000,
  notice_period: 12,
  # preferred_pronoun_select: /he\/him/i,
  preferred_pronoun_text: 'N/A',
  employee_referral: "no",
  admin: true)

puts "Created admin user:  #{User.last.first_name}"

# Admin user
User.create(
  email: ENV['CHARLIE_EMAIL'],
  password: ENV['CHARLIE_PASSWORD'],
  first_name: "Charlie",
  last_name: "Cheesman",
  address_first: "Le Haynes",
  address_second: "London",
  post_code: "E5 6KK",
  city: "London",
  # resume: "public/Obtretetskiy_cv.pdf",
  salary_expectation_text: "£30,000 - £40,000",
  # right_to_work: /yes/i,
  salary_expectation_figure: 30000,
  notice_period: 12,
  # preferred_pronoun_select: /he\/him/i,
  preferred_pronoun_text: 'N/A',
  employee_referral: "no",
  admin: true)

puts "Created admin user:  #{User.last.first_name}"

puts "Creating default user..."

# Default user
User.create(
  email: "usermissingemail@getcheddar.xyz",
  password: ENV['ADMIN_PASSWORD'],
  first_name: "UserMissingFirst",
  last_name: "UserMissingLast",
  phone_number: "+447555555555",
  address_first: "99 Missing Drive",
  address_second: "Missingham",
  post_code: "M1 1MM",
  city: "Missingdon",
  # resume: "public/Obtretetskiy_cv.pdf",
  salary_expectation_text: "£Missing - £Missing",
  # right_to_work: /yes/i,
  salary_expectation_figure: 99999,
  notice_period: 12,
  # preferred_pronoun_select: /he\/him/i,
  preferred_pronoun_text: 'N/A',
  employee_referral: "Missing",
  admin: false)

puts "Created default user:  #{User.last.first_name}"

puts "Creating standard users..."

User.create(
  email: "email2@gmail.com",
  password: "password",
  first_name: "Ilya",
  last_name: "the russian hacker",
  address_first: "15 Hackney Drive",
  address_second: "London",
  post_code: "E1 3KR",
  city: "London",
  # resume: "public/Obtretetskiy_cv.pdf",
  salary_expectation_text: "£30,000 - £40,000",
  # right_to_work: /yes/i,
  salary_expectation_figure: 30000,
  notice_period: 12,
  # preferred_pronoun_select: /he\/him/i,
  preferred_pronoun_text: 'N/A',
  employee_referral: "no",
  admin: false)

puts "Created user:  #{User.last.first_name}"

User.create(
  email: "d@gmail.com",
  password: "password",
  first_name: "Direncan",
  last_name: "the mysterious",
  address_first: "15 Hackney Drive",
  address_second: "London",
  post_code: "E1 3KR",
  city: "London",
  # resume: "public/Obtretetskiy_cv.pdf",
  salary_expectation_text: "£30,000 - £40,000",
  # right_to_work: /yes/i,
  salary_expectation_figure: 30000,
  notice_period: 12,
  # preferred_pronoun_select: /he\/him/i,
  preferred_pronoun_text: 'N/A',
  employee_referral: "no",
  admin: false)


User.create(
  email: "email3@gmail.com",
  password: "password",
  first_name: "Direncan",
  last_name: "the mysterious",
  address_first: "15 Hackney Drive",
  address_second: "London",
  post_code: "E1 3KR",
  city: "London",
  # resume: "public/Obtretetskiy_cv.pdf",
  salary_expectation_text: "£30,000 - £40,000",
  # right_to_work: /yes/i,
  salary_expectation_figure: 30000,
  notice_period: 12,
  # preferred_pronoun_select: /he\/him/i,
  preferred_pronoun_text: 'N/A',
  employee_referral: "no",
  admin: false)

puts "Created user:  #{User.last.first_name}"

# User.create(
#   email: "email4@gmail.com",
#   password: "password",
#   first_name: "Charlotte",
#   last_name: "the genius",
#   address_first: "15 Hackney Drive",
#   address_second: "London",
#   post_code: "E1 3KR",
#   city: "London",
#   resume: "public/Obtretetskiy_cv.pdf",
#   salary_expectation_text: "£30,000 - £40,000",
#   right_to_work: /yes/i,
#   salary_expectation_figure: 30000,
#   notice_period: 12,
#   preferred_pronoun_select: /he\/him/i,
#   preferred_pronoun_text: 'N/A',
#   employee_referral: "no",
#   admin: false)

# puts "Created user:  #{User.fourth.first_name}"

5.times do |_application|
  JobApplication.create(
    status: "Pre-test",
    user_id: User.first.id,
    job_id: Job.first.id
  )
  puts "Created job application for #{User.first.first_name} for #{Job.first.job_title}"
end

puts Company.all
puts Job.all
puts User.all
puts JobApplication.all

puts "Done!"

PgSearch::Multisearch.rebuild(Job)
PgSearch::Multisearch.rebuild(Company)


# -----------------------
# Template Job Structure:

# Job.create(
#   job_title: "XXX",
#   job_description: "XXX",
#   salary: XXX,
#   date_created: Date.XXX,
#   application_criteria: {
#     first_name: {
#       interaction: :input,
#       locators: XXX
#     },
#     last_name: {
#       interaction: :input,
#       locators: XXX
#     },
#     email: {
#       interaction: :input,
#       locators: XXX
#     },
#     phone_number: {
#       interaction: :input,
#       locators: XXX
#     },
#     resume: {
#       interaction: :upload,
#       locators: XXX
#     },
#     salary_expectation_text: {
#       interaction: :input,
#       locators: XXX
#     },
#     right_to_work: {
#       interaction: :input,
#       locators: XXX
#     },
#     salary_expectation_figure: {
#       interaction: :input,
#       locators: XXX
#     },
#     notice_period: {
#       interaction: :input,
#       locators: XXX
#     },
#     preferred_pronoun_select: {
#       interaction: :input,
#       locators: XXX
#     },
#     preferred_pronoun_text: {
#       interaction: :input,
#       locators: XXX
#     },
#     employee_referral: {
#       interaction: :input,
#       locators: XXX
#     }
#   },
#   application_deadline: Date.XXX,
#   job_posting_url: "XXX",
#   company_id: Company.XXX.id)

# ---------------------------
# Test method:
# ApplyJob.perform_now(16, 7)
