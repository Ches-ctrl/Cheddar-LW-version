class JobApplication < ApplicationRecord
  belongs_to :user
  belongs_to :job
  has_many :application_responses, dependent: :destroy

  has_one_attached :screenshot

  # TODO: Add validations for the job application model
  # TODO: have a complete message taken from the application page on successful execution
end
