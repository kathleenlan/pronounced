class AddAbuseReportStatusToAbuseReports < ActiveRecord::Migration
  def change
    add_column :abuse_reports, :abuse_report_status, :string
  end
end
