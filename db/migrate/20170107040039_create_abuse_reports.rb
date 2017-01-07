class CreateAbuseReports < ActiveRecord::Migration[5.0]
  def change
    create_table :abuse_reports do |t|
      t.references :pronunciation, null: false
      t.references :reported_by, null: false
      t.references :abuse_report_reason, null: false
      t.text :description

      t.timestamps null: false
    end

    add_foreign_key :abuse_reports, :pronunciations
    add_foreign_key :abuse_reports, :users, column: :reported_by_id
    add_foreign_key :abuse_reports, :properties, column: :abuse_report_reason_id
  end
end
