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

  multisearchable against: [:job_title, :job_description, :application_criteria]

  # Old search method - not required? Ask Charlotte
  # pg_search_scope :search_all_strings,
  #   against: [:job_title, :job_description, :application_criteria],
  #   using: {
  #     tsearch: { prefix: true }
  #   }

  # TODO: Add validations to job model

  def application_criteria
    read_attribute(:application_criteria).with_indifferent_access
  end
end
