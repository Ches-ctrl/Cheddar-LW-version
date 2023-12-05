class ScrapeJob < ApplicationJob
  include Capybara::DSL

  queue_as :default

  # TODO: Generalise away from TrueUp (low priority)

  # TODO: Setup cron job to run this at a regular interval
  # TODO: setup urls and search criteria for urls to run regularly

  # Link: 'https://www.trueup.io/jobs'
  # TODO: Click show more to see more jobs
  # TODO: Add serach functionality
  # TODO: Add user-agent so that the job is outputted
  # TODO: Work out why the CSS selectors are not working
  # Repeat for other search criteria or URLs if necessary

  def perform
    Capybara.default_max_wait_time = 10

    url = "https://lit-savannah-16798-1c35736be6e4.herokuapp.com/pages/contact"

    # url = [ENV['SCRAPE_URL_1'], ENV['SCRAPE_URL_2'], ENV['SCRAPE_URL_3'], ENV['SCRAPE_URL_4'], ENV['SCRAPE_URL_5'], ENV['SCRAPE_URL_6']]
    # search_criteria = ['London Developer', 'London Full Stack', 'London Product Management', 'London Data Science', 'London Data Engineering', 'London Design']

    # p "URL Options: #{url}"
    # p "Search Criteria Options: #{search_criteria}"
    # p "Which URL and search criteria would you like to scrape?"

    # url.each_with_index do |u, index|
    #   p "#{index + 1}. #{u} - #{search_criteria[index]}"
    # end

    # user_input = gets.chomp.to_i

    # if user_input.between?(1, url.length)
    #   url = url[user_input - 1]
    #   search_criteria = search_criteria[user_input - 1]
    # else
    #   puts "Invalid input. Please try again."
    #   return
    # end

    # TODO: Show user potential inputs and ask user to select url and search criteria (in console for now)
    # TODO: Update either background job status or required console input given inability to run in the background with console input

    visit(url)

    begin

      # TODO: Create 4x scrape emails
      # TODO: Create 4x scrape passwords
      # TODO: Tidy code
      # TODO: Add 4x search criteria
      # TODO: Update code to run all 4 sequentially and add to DB

      # No longer needed but kept for reference:
      # get_html_job = GetHtmlJob.perform_now(url)
      # doc = Nokogiri::HTML(get_html_job)

      # Login and fill in search criteria
      log_into_website
      # fill_in '.ais-SearchBox-input', with: search_criteria
      sleep 1 # Wait for the search to be conducted
      click_show_more(times: 3)

      job_cards = all('.card-body')

      job_cards.each do |job_card|
        job_url = job_card.first('div.fw-bold.mb-1 a.text-dark')&.[](:href)
        job_title = job_card.first('div.fw-bold.mb-1 a.text-dark')&.text&.strip
        company_attributes = {
          company_name: job_card.first('div.mb-2.align-items-baseline a.text-dark')&.text&.strip,
          location: job_card.first("div.text-secondary[style='width: 100%; font-size: 12px; font-weight: 500;']")&.text&.strip,
          industry: "Tech"
        }

        company = Company.find_or_initialize_by(name: company_attributes[:company_name])
        company.update(company_attributes)
          # TODO: Add company build details here
          # TODO: Add validations on company - if save and valid...
          # TODO: Update company model to have industry
          # new_company = Company.create(
          #                         name: 'New Company',
          #                         location: 'New Location',
          #                         industry: 'New Industry')

          # Check if the company was created successfully
          # if new_company.persisted?
          #   puts "New company created: #{new_company.name}"
          # else
          #   puts "Failed to create new company"
          # end
        end

        Job.find_or_create_by(job_posting_url:job_posting_url, job_title: job_title, company:company) do |job|
          # TODO: Split by question mark for UTM
          # TODO: Ask TA about how this creates a new job record and validating uniqueness
          # TODO: Add uniqueness condition that checks combination of job_posting_url, job_title and company
          # TODO: Add validations on job - if save and valid...
          # TODO: Add job build details here
          # p "Created job: #{job_title} at #{company_name} in #{job_location} posted #{time_since_posting} ago"
        end
      end

    rescue Capybara::ElementNotFound => e
      puts "Element not found: #{e.message}"
    end
  end

  private

  def log_into_website
    click_on 'Log in'
    wait_for_selector = 'username'
    find('#username')

    # TODO: Add 4x scrape emails and passwords
    # Randomly select an email and password from the scrape emails and passwords arrays
    scrape_emails = [ENV['SCRAPE_EMAIL_1'], ENV['SCRAPE_EMAIL_2'], ENV['SCRAPE_EMAIL_3'], ENV['SCRAPE_EMAIL_4']]
    scrape_passwords = [ENV['SCRAPE_PASSWORD_1'], ENV['SCRAPE_PASSWORD_2'], ENV['SCRAPE_PASSWORD_3'], ENV['SCRAPE_PASSWORD_4']]
    random_index = rand(scrape_emails.length)

    fill_in 'username', with: scrape_emails[random_index]
    fill_in 'password', with: scrape_passwords[random_index]
    find_button('Continue', class: 'c320322a4').click
  end

  def click_show_more(times: 3)
    times.times do
      begin
        show_more_button = find('.ais-InfiniteHits-loadMore')
        show_more_button.click

        # Optional: Wait for the next set of results to load
        # sleep 1

      rescue Capybara::ElementNotFound
        puts "Show more button not found"
        break # Exit the loop if the button is not found
      end
    end
  end

  def wait_for_selector
    # Wait for the search results to load; use a selector that identifies the loading of search results
    # wait_for_selector = 'ais-SearchBox-reset'
    # find(wait_for_selector)
  end

  def scroll_to_element
    # TODO: Update scroll_to_element to scroll to the element as currently doesn't work with multiple card-body elements
    # element_to_scroll_to = find('.card-body').first
    # p "Scrolling to element: #{element_to_scroll_to}"
    # scroll_to(element_to_scroll_to)
    # element_to_scroll_to.click
  end
end

# Rails console command: ScrapeJob.perform_now('https://www.trueup.io/jobs', 'Developer London')
