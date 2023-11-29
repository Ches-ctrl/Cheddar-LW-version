class Job < ApplicationRecord
  belongs_to :company
  has_many :job_applications, dependent: :destroy

  validates :job_title, :job_description, :application_deadline, presence: true
end
