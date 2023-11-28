class Job < ApplicationRecord
  belongs_to :company
  validates :job_title, :job_description, :salary, :application_deadline, presence: true
end
