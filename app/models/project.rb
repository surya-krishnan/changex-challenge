# frozen_string_literal: true

# Projects for Funds and Applicants to apply for funding for
class Project < ApplicationRecord
  validates :title, presence: true, uniqueness: true
  validates :payment_date, presence: true

  belongs_to :fund

  def sorted_payments
    payments.sort_by(&:date)
  end

  def applicants_for_project
    applicants = applicants.select do |applicant|
      if applicant.project.title == title
        true
      else
        false
      end
    end
    applicants.map(&:name).join(', ')
  end

end
