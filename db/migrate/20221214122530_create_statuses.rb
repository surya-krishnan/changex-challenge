class CreateStatuses < ActiveRecord::Migration[7.0]
  def change
    create_table :statuses do |t|
      t.integer :status_type
      t.text :comment
      t.references :applicant, null: false, foreign_key: true

      t.timestamps
    end
  end
end
