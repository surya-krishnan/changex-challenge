class Status < ApplicationRecord
  validates :comment, presence: true
  enum status_type: { applied: 0, initial_review: 1, more_information_required: 2, declined: 3, approved: 4 }
  belongs_to :applicant
end
