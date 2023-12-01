class JobApplication < ApplicationRecord
  belongs_to :user
  belongs_to :job

  has_one_attached :screenshot
  # TODO: have a complete message taken from the application page on successful execution
end
