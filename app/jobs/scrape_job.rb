# require 'nokogiri'

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

  def perform(*args)
    # Example URL and search criteria
    url = 'https://www.trueup.io/jobs'
    search_criteria = { keyword: 'Developer', location: 'London' }

    scrape_jobs(url, search_criteria)
  end

  private

  def scrape_jobs(url, search_criteria)
    visit(url)
    fill_search_criteria(search_criteria)

    job_cards = all('.card-body')

    p job_cards

    job_cards.each do |card|
      job_details = extract_job_details(card)
      create_or_update_job(job_details)
    end

    # TODO: Click show more to see more jobs
    # Repeat for other search criteria or URLs if necessary
  end

  def fill_search_criteria(criteria)
    criteria.each do |key, value|
      fill_in(key.to_s, with: value)
    end
  end

  def extract_job_details(card)
    # Extract and return job details from the card
    # Example:
    {
      title: card.find('.text-dark').text,
      company: card.find('.company-selector').text,
      location: card.find('.location-selector').text
      # Add other necessary fields
    }
  end

  def create_or_update_job(details)
     # Create or update job in the database
    # Be sure to check for uniqueness to avoid duplicates
    company = Company.find_or_create_by(name: details[:company])
    job = Job.find_or_initialize_by(title: details[:title], company: company)
    job.update(details)
  end
end
