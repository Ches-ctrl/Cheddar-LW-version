class JobApplication < ApplicationRecord
  belongs_to :user
  belongs_to :job

  # TODO: have a complete message taken from the application page on successful execution
end
