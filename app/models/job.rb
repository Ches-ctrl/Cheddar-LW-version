class Job < ApplicationRecord
  serialize :application_criteria, JSON
  belongs_to :company
  has_many :job_applications, dependent: :destroy
  has_many :saved_jobs, dependent: :destroy

  validates :job_title, :job_description, :application_deadline, presence: true

  # Commented out as not required - converts symbols to strings in the JSONB object
  # def application_criteria
  #   super.transform_keys(&:to_sym)
  # end

  include PgSearch::Model

  # multisearchable against: [:job_title, :job_description, :application_criteria]

  pg_search_scope :global_search,
    against: [:job_title, :salary, :job_description],
    associated_against: {
      company: [ :company_name, :company_category ]
    },
    using: {
      tsearch: { prefix: true }
    }
end
