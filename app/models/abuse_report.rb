class AbuseReport < ApplicationRecord
  validates :pronunciation, presence: true
  validates :reported_by, presence: true
  validates :abuse_report_reason, presence: true

  belongs_to :pronunciation, inverse_of: :abuse_reports
  belongs_to :reported_by, class_name: 'User', inverse_of: :abuse_reports
  belongs_to :abuse_report_reason
end
