class AtsFormat < ApplicationRecord
  belongs_to :applicant_tracking_system
  has_many :jobs, dependent: :destroy
end
