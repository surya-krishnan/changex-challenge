class RemoveStatusFromApplicants < ActiveRecord::Migration[7.0]
  def change
    remove_column :applicants, :status, :integer
  end
end
