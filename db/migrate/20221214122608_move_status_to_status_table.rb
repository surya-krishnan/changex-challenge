class MoveStatusToStatusTable < ActiveRecord::Migration[7.0]
  def change
    Applicant.all.each do |applicant|
      applicant.statuses.create(status_type: applicant.status, comment: "N/A: Status made before commenting enabled")
      applicant.save!
    end
  end
end
