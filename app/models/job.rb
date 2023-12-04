class Job < ApplicationRecord
  include Ats::Greenhouse
  include Ats::Workable
  serialize :application_criteria, JSON
  belongs_to :company
  has_many :job_applications, dependent: :destroy
  has_many :saved_jobs, dependent: :destroy
  before_create :set_application_criteria

  validates :job_title, :job_description, :application_deadline, presence: true

  # Commented out as not required - converts symbols to strings in the JSONB object
  # def application_criteria
  #   super.transform_keys(&:to_sym)
  # end

  include PgSearch::Model

  pg_search_scope :global_search,
    against: [:job_title, :salary, :job_description],
    associated_against: {
      company: [ :company_name, :company_category ]
    },
    using: {
      tsearch: { prefix: true }
    }

  def set_application_criteria
    if job_posting_url.include?('greenhouse')
      self.application_criteria = Job::GREENHOUSE_FIELDS
    elsif job_posting_url.include?('workable')
      self.application_criteria = Job::WORKABLE_FIELDS
    else
      self.application_criteria = {}
    end
  end

  # TODO: Add validations to job model

  def application_criteria
    read_attribute(:application_criteria).with_indifferent_access
  end
end
