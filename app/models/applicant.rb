# frozen_string_literal: true

# Applications to Projects
class Applicant < ApplicationRecord
  attribute :status, :integer, default: 0

  validates :name, presence: true, uniqueness: true
  validates :overview, presence: true
  validates :funding, numericality: true, presence: true

  belongs_to :project

  has_many :statuses, dependent: :destroy

  accepts_nested_attributes_for :statuses, reject_if: :all_blank

  def latest_status
    statuses.order(id: :desc).first.status_type
  end

  def project_title
    'Project'
  end
end
