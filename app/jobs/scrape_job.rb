# require 'nokogiri'

# NB. At the moment specific to TrueUp
# Rails console command: ScrapeJob.perform_now('https://www.trueup.io/jobs', 'Developer London')

class ScrapeJob < ApplicationJob
  include Capybara::DSL

  queue_as :default

  # Pseudocode:
  # 1. Visit the URL
  # 2. Add search criteria
  # 3. Click the search button
  # 4. Extract the results (a list of jobs and their details) based on job card
  # 5. Create a new job for each result
  # 6. If the associated company doesn't exist, create it
  # 7. Make sure to check for uniqueness
  # 8. Repeat for multiple pages if required
  # 9. Repeat for multiple search criteria if required
  # 10. Repeat for multiple URLs if required

  # Later: Setup cron job to run this at a regular interval
  # Later: setup urls and search criteria for urls to run regularly

  # Link: 'https://www.trueup.io/jobs'
  # TODO: Click show more to see more jobs
  # TODO: Add serach fucntionality
  # TODO: Add user-agent so that the job is outputted
  # TODO: Work out why the CSS selectors are not working
  # Repeat for other search criteria or URLs if necessary

  def perform(url, search_criteria)
    Capybara.default_max_wait_time = 10

    visit(url)

    begin
      # Step 1: Conduct a search for the job type
      # fill_in '.ais-SearchBox-input', with: search_criteria
      sleep 1 # Wait for the search to be conducted
      # click_show_more(times: 3)

      # Step 2: Wait for the search results to load
      # Use a selector that identifies the loading of search results
      # wait_for_selector = 'ais-SearchBox-reset'
      # find(wait_for_selector) # Waits until the specified element appears

      # get_html_job = GetHtmlJob.perform_now(url)

      # doc = Nokogiri::HTML(get_html_job)

      click_on 'Log in'
      wait_for_selector = 'username'
      find('#username')
      fill_in 'username', with: ENV['SCRAPE_EMAIL']
      fill_in 'password', with: ENV['SCRAPE_PASSWORD']
      find_button('Continue', class: 'c320322a4').click
      # click_on 'Continue'



      job_cards = all('.card-body')

      puts "Jobs cards:"
      puts job_cards

      # job_card = find('.card-body').first

      # puts "Job card:"
      # p job_card
      # p job_cards.size

      # element_to_scroll_to = find('.card-body').first

      p "scrolling"

      # Scroll to that element
      # scroll_to(element_to_scroll_to)

      # Now perform the action on the element, like clicking
      # element_to_scroll_to.click

      # job_cards = doc.css('.card-body') # Replace with the correct CSS selector for job cards

      job_cards.each do |job_card|
        # puts job_card.to_html
        job_url = job_card.first('div.fw-bold.mb-1 a.text-dark')&.[](:href)
        title = job_card.first('div.fw-bold.mb-1 a.text-dark')&.text&.strip
        company = job_card.first('div.mb-2.align-items-baseline a.text-dark')&.text&.strip
        location = job_card.first("div.text-secondary[style='width: 100%; font-size: 12px; font-weight: 500;']")&.text&.strip

        p job_url
        p title
        p company
        p location

        # title = job_card.at_css('.text-dark').text.strip # Replace with actual CSS selector
        # p title
        # company = job_card.at_css('.company-name-selector').text.strip # Replace with actual CSS selector
        # p company

        # Check for uniqueness and create job record
        Job.find_or_create_by(title: title, company: company) do |job|
          # set other job attributes here
        end
      end

      # Step 3: Extract job listings
      # job_listings = all('.card-body') # Replace with the selector that identifies job listings

      # p job_listings

      # TODO: Update job_listings selector to match the HTML structure of the job listing cards

    rescue Capybara::ElementNotFound => e
      puts "Element not found: #{e.message}"
    end
  end

  private

  def click_show_more(times: 3)
    times.times do
      begin
        # Find the 'Show more' button using its CSS classes and click it
        show_more_button = find('.ais-InfiniteHits-loadMore')
        show_more_button.click

        # Optional: Wait for the next set of results to load
        # sleep 1 # Adjust the sleep time based on the load time of your results

      rescue Capybara::ElementNotFound
        puts "Show more button not found"
        break # Exit the loop if the button is not found
      end
    end
  end

end


# --------------------
# Original search code
# --------------------

# require 'nokogiri'

# class ScrapeJob < ApplicationJob
#   include Capybara::DSL

#   queue_as :default

#   def perform(*args)
#     # Example URL and search criteria
#     url = 'https://www.trueup.io/jobs'
#     search_criteria = { keyword: 'Developer', location: 'London' }

#     scrape_jobs(url, search_criteria)
#   end

#   private

#   def scrape_jobs(url, search_criteria)
#     visit(url)
#     fill_search_criteria(search_criteria)

#     job_cards = all('.card-body')
#     job_cards.each do |card|
#       job_details = extract_job_details(card)
#       create_or_update_job(job_details)
#     end

#     # TODO: Click show more to see more jobs
#     # Repeat for other search criteria or URLs if necessary
#   end

#   def fill_search_criteria(criteria)
#     criteria.each do |key, value|
#       fill_in(key.to_s, with: value)
#     end
#   end

#   def extract_job_details(card)
#     # Extract and return job details from the card
#     # Example:
#     {
#       title: card.find('.text-dark').text,
#       company: card.find('.company-selector').text,
#       location: card.find('.location-selector').text
#       # Add other necessary fields
#     }
#   end

#   def create_or_update_job(details)
#     # Create or update job in the database
#     # Be sure to check for uniqueness to avoid duplicates
#     company = Company.find_or_create_by(name: details[:company])
#     job = Job.find_or_initialize_by(title: details[:title], company: company)
#     job.update(details)
#   end
# end

# job_listings.each do |listing|
#   # Extract the job title
#   # job_title = listing.find('a[href*="careers.bloomberg.com/job"]').text.strip
#   # company_name = listing.all('a[href="/co/bloomberg"]').first.text.strip
#   # company_logo_url = listing.find('a[href="/co/bloomberg"] > img')[:src]
#   job_location = listing.all('.text-secondary.mb-2').first ? listing.all('.text-secondary.mb-2').first.text.strip : nil
#   time_since_posting = listing.all('.overflow-hidden.text-secondary.small.mb-2')[1] ? listing.all('.overflow-hidden.text-secondary.small.mb-2')[1].text.strip : nil
#   company_description = listing.all('.text-secondary.small')[1] ? listing.all('.text-secondary.small')[1].text.strip : nil
#   job_description_items = listing.all('span.job-desc-item') ? listing.all('span.job-desc-item').map(&:text) : nil
#   company_trajectory_score = listing.find('.font-monospace') ? listing.find('.font-monospace').text.strip : nil
#   # job_posting_url = listing.find('a[href*="careers.bloomberg.com/job"][target="_blank"]')[:href]

#   next if Job.exists?(title: job_title, company: company_name, job_posting_url: job_posting_url)

#   Job.create(
#     title: job_title,
#     description: job_description_items.join("\n"),
#     location: job_location,
#     seniority: nil,
#     employment_type: nil,
#     company_name: company_name,
#     company_url: nil,
#     external_url: job_posting_url,
#     company_logo_url: company_logo_url,
#     company_description: company_description,
#     company_trajectory_score: company_trajectory_score,
#     application_criteria: nil,
#     application_deadline: nil,
#     job_posting_url: job_posting_url,
#   )

#   p "Created job: #{job_title} at #{company_name} in #{job_location} posted #{time_since_posting} ago"
# end
