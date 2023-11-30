class Job < ApplicationRecord
  belongs_to :company
  has_many :job_applications, dependent: :destroy
  has_many :saved_jobs, dependent: :destroy

  validates :job_title, :job_description, :application_deadline, presence: true

  include PgSearch::Model

  multisearchable against: [:job_title, :job_description, :application_criteria]

  # pg_search_scope :search_all_strings,
  #   against: [:job_title, :job_description, :application_criteria],
  #   using: {
  #     tsearch: { prefix: true }
  #   }
end
